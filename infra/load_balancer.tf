resource "aws_iam_policy" "load_balancer_controller" {
  name = "AWSLoadBalancerControllerIAMPolicy"
  policy = file("${path.module}/policies/load-balancer-controller-policy.json")
}

resource "aws_iam_role" "load_balancer_controller" {
  name = "eks-alb-ingress-controller"

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
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "load_balancer_controller" {
  policy_arn = aws_iam_policy.load_balancer_controller.arn
  role       = aws_iam_role.load_balancer_controller.name
}

# Create Kubernetes service account for Load Balancer Controller
resource "kubernetes_service_account" "load_balancer_controller" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.load_balancer_controller.arn
    }
  }
}
