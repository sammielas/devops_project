variable "repository_name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "fintech-cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
  default     = "1.27"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the EKS cluster will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the EKS cluster"
}

variable "eks_admin_users" {
  type        = list(string)
  description = "List of IAM usernames to grant EKS admin access"
  default     = []
}