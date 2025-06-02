
resource "aws_s3_bucket" "terraform_state" {
  bucket = "fintech-terraform-state-sammielas"

  tags = {
    Name = "fintech-terraform-state"
    Environment = var.environment
  }
}
