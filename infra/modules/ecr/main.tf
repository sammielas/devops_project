resource "aws_ecr_repository" "fintech_ecr" {
  name                 = var.repository_name
  image_tag_mutability = "IMMUTABLE"

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    Name        = var.repository_name
    Environment = var.environment
  }
}
