#!/bin/bash -xe

export TF_VAR_db_password="MyDumbPassword12345"

# Configure kubectl to connect to the EKS cluster
export CLUSTER_NAME=$(grep -C 4 cluster_name infra/variables.tf | grep default | grep -v 'us-east' | \
                      sed 's/.*= //' | sed 's/"//g')
echo "CLUSTER_NAME = $CLUSTER_NAME"
aws eks update-kubeconfig --name $CLUSTER_NAME

# Install AWS Load Balancer Controller
helm repo add eks https://aws.github.io/eks-charts
helm repo update
helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=$CLUSTER_NAME \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller

# Create IAM policy for Load Balancer Controller
# if it already exists, ignore the EntityAlreadyExists error
aws iam create-policy \
  --policy-name EKSLoadBalancerFullAccessPolicy \
  --policy-document '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:*",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "iam:CreateServiceLinkedRole",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:RevokeSecurityGroupIngress"
            ],
            "Resource": "*"
        }
    ]
}' || true

# Attach policy to role
aws iam attach-role-policy \
  --role-name eks-alb-ingress-controller \
  --policy-arn arn:aws:iam::222634358787:policy/EKSLoadBalancerFullAccessPolicy

# Build and push the Docker image to ECR
export ECR_REPO_URI=$(aws ecr describe-repositories --repository-names bookreview-api \
                      --query 'repositories[0].repositoryUri' --output text)
echo "ECR_REPO_URI = $ECR_REPO_URI"
docker build -t $ECR_REPO_URI:latest .
aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_REPO_URI
docker push $ECR_REPO_URI:latest

# Create Kubernetes secrets
kubectl create secret generic db-credentials --from-literal=password=MyDumbPassword12345 || true

# Deploy the application to EKS
kubectl delete deployment bookreview-api || true
kubectl apply -f k8s-manifests.yaml
kubectl apply -f deployment.yaml

# Restart Load Balancer Controller to apply new permissions
kubectl rollout restart deployment aws-load-balancer-controller -n kube-system

# Load balancer info
export LONG_INGRESS_NAME="$(kubectl get ingress bookreview-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')"
export INGRESS_NAME="$(echo $LONG_INGRESS_NAME | sed 's/\([^.]*\).*/\1/' | sed 's/-[^-]*$//')"
export ALB_ARN=$(aws elbv2 describe-load-balancers --names $INGRESS_NAME --query 'LoadBalancers[0].LoadBalancerArn' --output text)
echo "ALB_ARN = $ALB_ARN"
aws elbv2 describe-listeners --load-balancer-arn $ALB_ARN

# Check target group health:
export TG_ARN=$(aws elbv2 describe-target-groups --load-balancer-arn $ALB_ARN --query 'TargetGroups[0].TargetGroupArn' --output text) 
echo "TG_ARN = $TG_ARN"
aws elbv2 describe-target-health --target-group-arn $TG_ARN

# Access the application via the ALB URL:
export ALB_URL=$(kubectl get ingress bookreview-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo "Some things to check if anything goes wrong"
echo "- Ensure the backend security group allows inbound traffic from the ALB on the application port"
echo "- The ALB should be in public subnets"
echo "- The Ingress resource should have 'alb.ingress.kubernetes.io/target-type: ip'"
echo "Application URL: http://$ALB_URL"
