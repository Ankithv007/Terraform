variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-west-2"  # Change to your preferred region
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for storing Terraform state"
  type        = string
  default     = "ankiths3bucket-1"  # Change as needed
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-lock"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-12345678"  # Replace with a valid AMI ID in your region
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

