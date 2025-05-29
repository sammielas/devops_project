variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "iam_policy_arn" {
  type        = string
  description = "ARN of IAM policy"
}