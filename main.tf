module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
  region      = var.region
  vpc_cidr    = var.vpc_cidr
}
