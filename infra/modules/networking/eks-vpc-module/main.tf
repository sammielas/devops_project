provider "aws" {
  region = "us-east-1"
}


data "aws_availability_zones" "available" {}


module "fintech-app-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
 

  name            = "fintech-app-vpc"
  cidr            = var.vpc_cidr_block
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets  = var.public_subnet_cidr_blocks
  azs             = data.aws_availability_zones.available.names

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/fintech-app-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/fintech-app-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                  = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/fintech-app-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }

}



module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.21.0"

  cluster_name    = "fintech-app-eks-cluster"
  cluster_version = "1.22"

  subnet_ids = module.fintech-app-vpc.private_subnets
  vpc_id     = module.fintech-app-vpc.vpc_id

  tags = {
    environment = "development"
    application = "fintech-app"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t2.small"]
    }
  }
}