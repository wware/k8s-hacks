variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "bookreview-cluster"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "bookreview"
}

variable "db_username" {
  description = "Database admin username"
  type        = string
  default     = "wware"
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  default     = "MyDumbPassword12345"
}
