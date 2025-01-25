#!/bin/bash -xe

# Verify the ALB listener configuration:
# Get the ALB name 
export ALB_NAME=$(kubectl get ingress bookreview-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' | cut -d '-' -f 1)
echo "ALB_NAME = $ALB_NAME"

export ALB_ARN=$(aws elbv2 describe-load-balancers --names $ALB_NAME --query 'LoadBalancers[0].LoadBalancerArn' --output text)
echo "ALB_ARN = $ALB_ARN"
aws elbv2 describe-listeners --load-balancer-arn $ALB_ARN

# Check target group health:
export TG_ARN=$(aws elbv2 describe-target-groups --load-balancer-arn $ALB_ARN --query 'TargetGroups[0].TargetGroupArn' --output text) 
echo "TG_ARN = $TG_ARN"
aws elbv2 describe-target-health --target-group-arn $TG_ARN

# Access the application via the ALB URL:
export ALB_URL=$(kubectl get ingress bookreview-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo "Application URL: http://$ALB_URL"
echo "- Ensure the backend security group allows inbound traffic from the ALB on the application port"
echo "- The ALB should be in public subnets"
echo "- The Ingress resource should have 'alb.ingress.kubernetes.io/target-type: ip'"
