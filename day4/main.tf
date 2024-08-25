provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "ankith-s3-demo-abc" 
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}