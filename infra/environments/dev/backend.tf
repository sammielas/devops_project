terraform {
  backend "s3" {
    bucket       = "fintech-terraform-state-sammielas"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
