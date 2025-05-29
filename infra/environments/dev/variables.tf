variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS cluster"
}
