# modules/ec2/main.tf
variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the instance"
  type        = string
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance-${terraform.workspace}"
  }
}

