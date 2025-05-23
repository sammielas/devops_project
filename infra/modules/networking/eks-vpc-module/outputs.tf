# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# Output the private subnet IDs
output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnets
}

# Output the public subnet IDs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnets
}

# Output the EKS cluster name
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_id
}

# Output the EKS cluster endpoint
output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}

# Output the EKS cluster version
output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = module.eks.cluster_version
}
