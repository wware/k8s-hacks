# Deployment Instructions

1. Provision EKS cluster and related AWS resources using Terraform:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
   - The cluster name is defined in the `cluster_name` variable in `infra/variables.tf`.

2. Configure kubectl to connect to the EKS cluster:
   ```bash
   aws eks update-kubeconfig --name <cluster-name>
   ```

3. Build and push the Docker image to ECR:
   ```bash
   # Get the ECR repository URI
   export ECR_REPO_URI=$(aws ecr describe-repositories --repository-names bookreview-api --query 'repositories[0].repositoryUri' --output text)

   docker build -t $ECR_REPO_URI:latest .
   aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_REPO_URI
   docker push $ECR_REPO_URI:latest
   ```

4. Deploy the application to EKS:
   ```bash
   kubectl apply -f k8s-manifests.yaml
   ```

5. Check that the pods are running:
   ```bash
   kubectl get pods
   ```

6. Verify the ALB listener configuration:
   ```bash
   # Get the ALB name 
   export ALB_NAME=$(kubectl get ingress bookreview-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' | cut -d '-' -f 1)

   export ALB_ARN=$(aws elbv2 describe-load-balancers --names $ALB_NAME --query 'LoadBalancers[0].LoadBalancerArn' --output text)
   aws elbv2 describe-listeners --load-balancer-arn $ALB_ARN
   ```

7. Check target group health:
   ```bash
   export TG_ARN=$(aws elbv2 describe-target-groups --load-balancer-arn $ALB_ARN --query 'TargetGroups[0].TargetGroupArn' --output text) 
   aws elbv2 describe-target-health --target-group-arn $TG_ARN
   ```

8. Access the application via the ALB URL:
   ```bash
   export ALB_URL=$(kubectl get ingress bookreview-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
   echo "Application URL: http://$ALB_URL"
   ```

Additional Notes:
- Ensure the backend security group allows inbound traffic from the ALB on the application port
- The ALB should be in public subnets
- The Ingress resource should have `alb.ingress.kubernetes.io/target-type: ip`