resource "aws_iam_role" "app_role" {
  name = "bookreview-app-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = module.eks.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:default:bookreview-app"
        }
      }
    }]
  })
}
