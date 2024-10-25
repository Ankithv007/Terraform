provider "aws" {
  region = "ap-south-1"  # You can change this to your desired region
}

resource "aws_instance" "terraform_instance" {
  ami           = "ami-0dee22c13ea7a9a67"    # Replace with your AMI ID
  instance_type = "t2.micro"        # Choose the instance type you need

  key_name      = "jaya"            # Key pair name

  tags = {
    Name = "terraform"              # Name tag for the EC2 instance
  }

  # Optional: Security group to allow SSH access (port 22)
  security_groups = ["default"]      # You can create a security group if needed
}

output "instance_id" {
  value = aws_instance.terraform_instance.id
}

output "instance_public_ip" {
  value = aws_instance.terraform_instance.public_ip
}
