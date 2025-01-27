# Create a subnet group for RDS instance placement
# Uses private subnets from the VPC for enhanced security
resource "aws_db_subnet_group" "bookreview" {
  name       = "bookreview-db-subnet"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "BookReview DB subnet group"
  }
}

# Security group to control database access
# Only allows PostgreSQL traffic from the EKS cluster
resource "aws_security_group" "rds" {
  name        = "bookreview-rds-sg"
  description = "Security group for RDS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [module.eks.cluster_security_group_id]
  }
}

# PostgreSQL RDS instance for the book review application
resource "aws_db_instance" "bookreview" {
  # Instance identification and size configuration
  identifier           = "bookreview-db"
  allocated_storage    = 20
  storage_type         = "gp3"  # General Purpose SSD v3 for balanced performance
  engine              = "postgres"
  engine_version      = "14"
  instance_class      = "db.t3.micro"  # Development tier - adjust for production

  # Database configuration
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true  # Warning: Set to false in production

  # Network and security configuration
  db_subnet_group_name   = aws_db_subnet_group.bookreview.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  # Backup configuration
  backup_retention_period = 7    # Keep backups for 7 days
  multi_az               = false # Single AZ for dev - enable for production

  tags = {
    Environment = "production"
  }
}
