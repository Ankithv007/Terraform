resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_pair

  tags = {
    Name = "MainEC2Instance"
  }
}
