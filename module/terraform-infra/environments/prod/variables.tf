variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones to use"
}

variable "public_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
}

variable "private_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "instance_type" {
  type        = string
  description = "Instance type for EC2"
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 key pair"
}

variable "name_prefix" {
  type        = string
  description = "Prefix to use in naming AWS resources"
}
