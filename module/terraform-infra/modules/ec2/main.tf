resource "aws_instance" "bastion" {
  for_each              = var.public_subnet_ids_map
  ami                   = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = each.value
  vpc_security_group_ids = [var.bastion_sg_id]
  key_name              = var.key_name

  tags = {
    Name = "${var.name_prefix}-bastion-${each.key}"
  }
}

resource "aws_instance" "app" {
  for_each              = var.private_subnet_ids_map
  ami                   = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = each.value
  vpc_security_group_ids = [var.app_sg_id]
  key_name              = var.key_name

  tags = {
    Name = "${var.name_prefix}-app-${each.key}"
  }
}
