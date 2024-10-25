provider "aws" {
  region = var.region
}

module "vpc" {
  source            = "./modules/vpc"
  cidr_block        = var.cidr_block
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
  key_pair      = var.key_pair
}
