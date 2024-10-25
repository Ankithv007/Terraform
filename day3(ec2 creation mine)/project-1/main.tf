resource "aws_instance" "example" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_pair
  availability_zone = "ap-south-1a" # or remove for any available zone in the region

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}
