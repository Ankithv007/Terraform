provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type based on the environment"
  type        = map(string)

  default = {
    dev   = "t2.micro"
    stage = "t2.medium"
    prod  = "t2.xlarge"
  }
}

module "ec2_instance" {
  source         = "./modules/ec2"
  ami            = var.ami
  instance_type  = lookup(var.instance_type, terraform.workspace, "t2.micro")
}

