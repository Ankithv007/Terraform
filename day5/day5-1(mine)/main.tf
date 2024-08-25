provider "aws" {
   region = "ap-south-1"
}
resource "aws_vpc" "ank-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc for ankith"
  }
}

resource "aws_subnet" "ank-subnet-pub1" {
  vpc_id = aws_vpc.ank-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name ="subnet for public sub 1a" 
  }
}

resource "aws_subnet" "ank-subnet-pub2" {
  vpc_id = aws_vpc.ank-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name ="subnet for public sub 1b" 
  }
}

resource "aws_subnet" "ank-subnet-pri1" {
  vpc_id = aws_vpc.ank-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name ="subnet for private sub  1a" 
  }
}
resource "aws_subnet" "ank-subnet-pri2" {
  vpc_id = aws_vpc.ank-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name ="subnet for private sub 1b" 
  }
}


resource "aws_internet_gateway" "ank-igw" {
  vpc_id = aws_vpc.ank-vpc.id

  tags = {
    Name =" attach to aws and igw"

  }
}

resource "aws_route_table" "ank-rt" {
  vpc_id = aws_vpc.ank-vpc.id

  route  {
    cidr_block ="0.0.0.0/0"
    gateway_id =aws_internet_gateway.ank-igw.id
  }

  tags = {
  Name =" rt for vpc"
}

}

resource "aws_route_table_association" "pub-rt-1" {
  subnet_id = aws_subnet.ank-subnet-pub1.id
  route_table_id = aws_route_table.ank-rt.id
}

resource "aws_security_group" "ank-sg" {
    name = "HTTP and SSH"
    vpc_id = aws_vpc.ank-vpc.id

     ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_instance" "web_instance" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  key_name      = "key_pair"

  subnet_id                   = aws_subnet.ank-subnet-pub1.id
  vpc_security_group_ids      = [aws_security_group.ank-sg.id]
  associate_public_ip_address = true

  tags = {
    "Name" : "ankith EC2"
  }
}