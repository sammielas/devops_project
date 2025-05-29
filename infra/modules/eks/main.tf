
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  cluster_endpoint_public_access = true
  subnet_ids = var.subnet_ids
  vpc_id     = var.vpc_id

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 3
      instance_types = ["t2.small"]
    }
  }

  tags = {
    Name        = var.cluster_name
    Environment = var.environment
  }
}
