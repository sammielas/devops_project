output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.fintech-app-vpc.vpc_id
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.fintech-app-vpc.private_subnets
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_id
}


