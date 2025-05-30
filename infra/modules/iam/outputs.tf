output "eks_admin_policy_arn" {
  description = "ARN of the EKS admin policy"
  value       = aws_iam_policy.eks_cluster_admin.arn
}