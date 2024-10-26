# backend.tf
terraform {
  backend "s3" {
    bucket         = "ankiths3bucket-statefile"       # Replace with actual bucket name
    key            = "state/terraform.tfstate"   # Path within the bucket
    region         = "ap-south-1"                 # Specify your AWS region
    dynamodb_table = "terraform-state-lock"      # Name of the DynamoDB table
    encrypt        = true
  }
}

