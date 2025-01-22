resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name = module.eks.cluster_name
  addon_name = "aws-ebs-csi-driver"
  addon_version = "v1.25.0-eksbuild.1"
  service_account_role_arn = aws_iam_role.ebs_csi.arn
  preserve = true
}

resource "aws_iam_role" "ebs_csi" {
  name = "eks-ebs-csi-driver"

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
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ebs_csi" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi.name
}
