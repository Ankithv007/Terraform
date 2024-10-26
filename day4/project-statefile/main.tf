provider "aws" {
  region = var.region
}

# Create S3 Bucket for State Storage
resource "aws_s3_bucket" "state_storage" {
  bucket = var.s3_bucket_name
  acl    = "private"
  
  versioning {
    enabled = true
  }
}

# Create DynamoDB Table for State Locking
resource "aws_dynamodb_table" "state_lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}

# Create EC2 Instance
resource "aws_instance" "example_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  tags = {
    Name = "ExampleEC2"
  }
}
