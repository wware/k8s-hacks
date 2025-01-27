# Install the AWS EBS CSI Driver as an EKS add-on
# This enables dynamic provisioning of EBS volumes for pod storage
resource "aws_eks_addon" "ebs_csi_driver" {
  cluster_name = module.eks.cluster_name
  addon_name = "aws-ebs-csi-driver"
  # Specific version for compatibility and stability
  addon_version = "v1.25.0-eksbuild.1"
  # Link to the IAM role for EBS operations
  service_account_role_arn = aws_iam_role.ebs_csi.arn
  # Preserve the add-on during updates to prevent disruption
  preserve = true
}

# IAM Role for the EBS CSI Driver
# Enables the driver to create, attach, and delete EBS volumes
resource "aws_iam_role" "ebs_csi" {
  name = "eks-ebs-csi-driver"

  # Trust policy allowing the EKS cluster's OIDC provider to assume this role
  # Uses IRSA (IAM Roles for Service Accounts) for secure pod authentication
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = module.eks.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      # Condition ensures only the EBS CSI controller service account can assume this role
      Condition = {
        StringEquals = {
          "${module.eks.oidc_provider}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
        }
      }
    }]
  })
}

# Attach the AWS-managed EBS CSI policy to the role
# This policy contains all necessary permissions for EBS operations
resource "aws_iam_role_policy_attachment" "ebs_csi" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.ebs_csi.name
}
