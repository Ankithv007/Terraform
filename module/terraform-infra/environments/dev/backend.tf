terraform {
  backend "s3" {
    bucket = "ankith-terraform-state-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
