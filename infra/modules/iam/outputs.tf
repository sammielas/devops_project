output "s3_access_role_arn" {
  value       = aws_iam_role.s3_access_role.arn
  description = "ARN of the additional S3 IAM role"
}
