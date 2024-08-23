provider "aws" {
  region = var.region
}
 module "project_vpc" {
  source  = "../module/vpc"
  region                                 =var.region
  project_vpc                            =var.project_vpc
  vpc_cidr                               =var.vpc_cidr
  cidr_block_az1                         =var.cidr_block_az1
  cidr_block_az2                         =var.cidr_block_az2
  private-cidr_block_az1                 =var.private-cidr_block_az1
  private-cidr_block_az2                 =var.private-cidr_block_az2
  private-data-subnet-cidr_block_az1     =var.private-data-subnet-cidr_block_az1
  private-data-subnet-cidr_block_az2     =var.private-data-subnet-cidr_block_az2

}
