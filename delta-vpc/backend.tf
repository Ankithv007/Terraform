# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "mybucketankith.dev"
    key       = "delta-vpc.tfstate"
    region    = "ap-south-1"
  }
}