# IAM Role for the Book Review Application
# Enables pods to access AWS services using IRSA (IAM Roles for Service Accounts)
resource "aws_iam_role" "app_role" {
  name = "bookreview-app-role"

  # Trust policy for EKS service account authentication
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        # Use OIDC provider for secure pod identity
        Federated = module.eks.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      # Restrict role assumption to specific service account
      Condition = {
        StringEquals = {
          # Only pods using the 'bookreview-app' service account in 'default' namespace
          # can assume this role
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:default:bookreview-app"
        }
      }
    }]
  })
}
# Note: Additional policy attachments should be added here based on
# what AWS services the application needs to access (S3, SQS, etc.)
