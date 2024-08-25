terraform {
  backend "s3" {
    bucket         = "ankith-s3-demo-abc" 
    key            = "ankith-terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}