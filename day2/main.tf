provider "aws" {
  region = "ap-south-1"
}
module "ec2" {
  source = "../module/ec2"
  ami_value = var.ami_value
  instance_type = var.instance_type
}