# Deployment Instructions

1. Provision EKS cluster and related AWS resources using Terraform, in the `infra` directory:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
   Alternatively:
   ```bash
   terraform init
   terraform plan -out=Plan 2>&1 | sed -r "s/\x1B\[[0-9;]*[mG]//g" > PLAN_NOTES.txt
   terraform apply Plan
   ```

2. Configure kubectl to connect to the EKS cluster, Build and push the Docker image to ECR,
Deploy the application to EKS, Check that the pods are running:
   ```bash
   ./step1.sh
   ```

3. Verify the ALB listener configuration, Check target group health, Access the application via the ALB URL:
   ```bash
   ./step2.sh
   ```

Additional Notes:
- Ensure the backend security group allows inbound traffic from the ALB on the application port
- The ALB should be in public subnets
- The Ingress resource should have `alb.ingress.kubernetes.io/target-type: ip`