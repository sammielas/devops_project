
resource "aws_db_instance" "fintech_rds" {
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username            = var.db_user
  password            = var.db_password
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "fintech-db"
    Environment = var.environment
  }
}
