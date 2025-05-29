
resource "aws_route53_zone" "fintech_dns" {
  name = var.domain_name

  tags = {
    Name        = var.domain_name
    Environment = var.environment
  }
}

