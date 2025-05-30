output "ecr_repository_url" {
  value       = aws_ecr_repository.fintech_ecr.repository_url
  description = "URL of the ECR repository"
}
