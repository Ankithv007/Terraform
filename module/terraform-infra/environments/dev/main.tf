provider "aws" {
  region = var.aws_region
}

# VPC
module "vpc" {
  source      = "../../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  name_prefix = var.name_prefix
}

# Subnets
module "subnets" {
  source         = "../../modules/subnets"
  vpc_id         = module.vpc.vpc_id
  azs            = var.azs
  public_cidrs   = var.public_cidrs
  private_cidrs  = var.private_cidrs
  name_prefix    = var.name_prefix
}

# Internet Gateway
module "internet_gateway" {
  source      = "../../modules/internet_gateway"
  vpc_id      = module.vpc.vpc_id
  name_prefix = var.name_prefix
}

# NAT Gateway
module "nat_gateway" {
  source            = "../../modules/nat_gateway"  
  public_subnet_id  = module.subnets.public_subnet_ids[1]
  igw_id            = module.internet_gateway.igw_id
  name_prefix       = var.name_prefix
}


# Route Tables
module "route_tables" {
  source              = "../../modules/route_tables"
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.internet_gateway.igw_id
  nat_gateway_id      = module.nat_gateway.nat_gateway_id
  name_prefix         = var.name_prefix

  public_subnet_ids_map = {
    public-a = module.subnets.public_subnet_ids[0]
    public-b = module.subnets.public_subnet_ids[1]
  }

  private_subnet_ids_map = {
    private-a = module.subnets.private_subnet_ids[0]
    private-b = module.subnets.private_subnet_ids[1]
  }
}



# Security Groups
module "security_groups" {
  source      = "../../modules/security_groups"
  vpc_id      = module.vpc.vpc_id
  name_prefix = var.name_prefix
}

# EC2
module "ec2" {
  source              = "../../modules/ec2"
  name_prefix         = var.name_prefix
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name

  bastion_sg_id       = module.security_groups.bastion_sg_id
  app_sg_id           = module.security_groups.app_sg_id

  public_subnet_ids_map = {
    public-a = module.subnets.public_subnet_ids[0]
    # public-b = module.subnets.public_subnet_ids[1]
  }

  private_subnet_ids_map = {
    private-a = module.subnets.private_subnet_ids[0]
    # private-b = module.subnets.private_subnet_ids[1]
  }
}

