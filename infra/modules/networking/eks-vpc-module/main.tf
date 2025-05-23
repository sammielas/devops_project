# Provider configuration
provider "aws" {
  region = var.aws_region # Specify the AWS region for deployment
}

# Use the AWS VPC module to create a network
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" # Source of the module (Terraform Registry)
  

  name = "${var.environment}-vpc" # Name tag for the VPC
  cidr = var.vpc_cidr # CIDR block for the VPC

  # Specify Availability Zones (AZs) and subnet CIDRs
  azs             = var.azs # List of availability zones
  public_subnets  = var.public_subnet_cidrs # Public subnets CIDR blocks
  private_subnets = var.private_subnet_cidrs # Private subnets CIDR blocks

  # Enable features
  enable_nat_gateway = true # Enable NAT Gateway for private subnets
  enable_dns_support = true # Enable DNS support
  enable_dns_hostnames = true # Enable DNS hostnames

  tags = {
    Environment = var.environment # Environment tag
  }
}

# Use the AWS EKS module to create an EKS cluster
# Main EKS configuration
module "eks" {
  source  = "terraform-aws-modules/eks/aws" # Source of the module (Terraform Registry)
  version = "~> 18.0" # Version of the module

  cluster_name    = "${var.environment}-eks-cluster" # Name of the EKS cluster
  cluster_version = var.kubernetes_version          # Kubernetes version for the cluster

  # Networking configuration
  vpc_id     = module.vpc.vpc_id # Use the VPC ID created by the VPC module
  subnet_ids = module.vpc.private_subnets # Use private subnets for EKS nodes

  tags = {
    Environment = var.environment # Environment tag
  }
}

# Define EKS-managed Node Groups
resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = module.eks.cluster_name # Reference the cluster created by the EKS module
  node_group_name = "eks-nodes"             # Name of the node group
  node_role_arn   = var.node_role_arn       # IAM role ARN for the nodes

  subnet_ids = module.vpc.private_subnets # Use private subnets for the nodes

  scaling_config {
    desired_size = 2 # Desired number of nodes
    max_size     = 5 # Maximum number of nodes
    min_size     = 1 # Minimum number of nodes
  }

  instance_types = [var.node_instance_type] # Instance type for the nodes

  tags = {
    Name        = "${var.environment}-eks-nodes"
    Environment = var.environment
  }
}
