module "vpc" {
  source                     = "../../modules/vpc"
  vpc_cidr_block             = var.vpc_cidr_block
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  environment                = var.environment
}

module "eks" {
  source          = "../../modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  environment     = var.environment
}
