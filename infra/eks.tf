# Main EKS cluster configuration using the official AWS EKS module
# Creates a production-grade Kubernetes cluster with managed node groups
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  # Cluster identity and version configuration
  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  # Network configuration - uses VPC and subnets created in vpc.tf
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Allow public access to the Kubernetes API server
  # Security Note: Restrict this in production using allowed_cidr_blocks
  cluster_endpoint_public_access = true

  # Node group configuration for running application workloads
  eks_managed_node_groups = {
    general = {
      # Auto-scaling configuration
      desired_size = 2  # Regular operation capacity
      min_size     = 1  # Minimum for cost optimization
      max_size     = 3  # Maximum for peak loads

      # Instance configuration
      instance_types = ["t3.medium"]  # Good for general workloads
      capacity_type  = "ON_DEMAND"    # Ensures consistent availability
    }
  }

  # Enable IAM Roles for Service Accounts (IRSA)
  # Required for AWS service integrations (EBS CSI, Load Balancer controller)
  enable_irsa = true

  tags = {
    Environment = "production"
    Terraform   = "true"
  }
}
