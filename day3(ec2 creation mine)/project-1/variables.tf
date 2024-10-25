variable "region" {
  description = "The AWS region to deploy in"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID to launch the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_pair" {
  description = "Name of the key pair to use for SSH access"
  type        = string
}
