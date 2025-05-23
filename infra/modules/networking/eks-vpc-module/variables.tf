# Define AWS region
variable "aws_region" {
  description = "AWS region for the deployment"
  default     = "us-east-1"
}

# Define environment name
variable "environment" {
  description = "Environment name"
  default     = "dev"
}

# Define VPC CIDR block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

# Define public subnet CIDRs
variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

# Define private subnet CIDRs
variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Define availability zones
variable "azs" {
  description = "Availability Zones for subnets"
  default     = ["us-east-1a", "us-east-1b"]
}

# Define Kubernetes version
variable "kubernetes_version" {
  description = "Version of Kubernetes for the EKS cluster"
  default     = "1.31"
}

# Define instance type for EKS nodes
variable "node_instance_type" {
  description = "EC2 instance type for EKS nodes"
  default     = "t3.medium"
}

# Define IAM Role ARN for EKS Node Group
variable "node_role_arn" {
  description = "The ARN of the IAM Role for the EKS Node Group"
}
