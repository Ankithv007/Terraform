resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "MainSubnet"
  }
}
