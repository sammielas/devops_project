output "ecr_repository_url" {
  value       = aws_ecr_repository.fintech_ecr.repository_url
  description = "URL of the ECR repository"
}

output "repository_url" {
  value = aws_ecr_repository.fintech-dev-repo.repository_url
}

output "repository_arn" {
  value = aws_ecr_repository.fintech-dev-repo.arn
}
