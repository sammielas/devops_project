# modules/eks/variables.tf
variable "eks_admin_users" {
  description = "List of IAM usernames to grant EKS admin access"
  type        = list(string)
  default     = []
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}