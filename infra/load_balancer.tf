# AWS Load Balancer Controller IAM Policy
# Required for the controller to manage ALB/NLB resources in AWS
resource "aws_iam_policy" "load_balancer_controller" {
  name = "AWSLoadBalancerControllerIAMPolicy"
  # Policy document is stored separately for better maintainability
  policy = file("${path.module}/policies/load-balancer-controller-policy.json")
}

# IAM Role for the Load Balancer Controller
# Uses IRSA (IAM Roles for Service Accounts) for secure pod authentication
resource "aws_iam_role" "load_balancer_controller" {
  name = "eks-alb-ingress-controller"

  # Trust policy allowing the EKS cluster's OIDC provider to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = module.eks.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      # Condition ensures only the specific service account can assume this role
      Condition = {
        StringEquals = {
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
        }
      }
    }]
  })
}

# Attach the Load Balancer Controller policy to the role
resource "aws_iam_role_policy_attachment" "load_balancer_controller" {
  policy_arn = aws_iam_policy.load_balancer_controller.arn
  role       = aws_iam_role.load_balancer_controller.name
}

# Kubernetes Service Account for the Load Balancer Controller
# Links the Kubernetes service account to the AWS IAM role using annotations
resource "kubernetes_service_account" "load_balancer_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"  # System namespace for cluster-wide resources
    annotations = {
      # This annotation links the service account to the IAM role
      "eks.amazonaws.com/role-arn" = aws_iam_role.load_balancer_controller.arn
    }
  }
}
