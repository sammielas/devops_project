provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "fintech-dev-repo" {
  name = "fintech-dev-app"
}
