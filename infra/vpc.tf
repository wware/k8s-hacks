# VPC Configuration for EKS Cluster
# Creates a production-ready VPC with public and private subnets
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-vpc"
  cidr = var.vpc_cidr  # Defined in variables.tf, defaults to 10.0.0.0/16

  # Create subnets in two availability zones for high availability
  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  # Private subnets for EKS nodes and RDS
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  # Public subnets for load balancers and NAT gateways
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  # NAT Gateway configuration
  enable_nat_gateway = true
  single_nat_gateway = true  # Cost-optimization for non-prod; use multiple NATs in production

  # DNS configuration - required for EKS and RDS hostname resolution
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags required for EKS cluster to identify VPC resources
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  # Tags required for public subnets
  # Enables Kubernetes to discover subnets for public load balancers
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

  # Tags required for private subnets
  # Enables Kubernetes to discover subnets for internal load balancers
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}
