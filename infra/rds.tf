resource "aws_db_subnet_group" "bookreview" {
  name       = "bookreview-db-subnet"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "BookReview DB subnet group"
  }
}

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

resource "aws_db_instance" "bookreview" {
  identifier           = "bookreview-db"
  allocated_storage    = 20
  storage_type         = "gp3"
  engine              = "postgres"
  engine_version      = "14"
  instance_class      = "db.t3.micro"
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true

  db_subnet_group_name   = aws_db_subnet_group.bookreview.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  backup_retention_period = 7
  multi_az               = false

  tags = {
    Environment = "production"
  }
}
