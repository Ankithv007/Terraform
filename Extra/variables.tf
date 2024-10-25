variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
  default     = "ap-south-1a"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Type of the instance"
  default     = "t2.micro"
}

variable "key_pair" {
  description = "Key pair name for SSH access"
}
