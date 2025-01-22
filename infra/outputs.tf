output "rds_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.bookreview.endpoint
}

output "load_balancer_role_arn" {
  description = "ARN of the load balancer controller IAM role"
  value       = aws_iam_role.load_balancer_controller.arn
}

output "storage_class_name" {
  description = "Name of the created storage class"
  value       = kubernetes_storage_class.ebs_sc.metadata[0].name
}
