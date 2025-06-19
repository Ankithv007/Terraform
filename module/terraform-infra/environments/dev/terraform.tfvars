aws_region    = "ap-south-1"
vpc_cidr      = "10.0.0.0/16"
azs           = ["ap-south-1a", "ap-south-1b"]

public_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

ami_id        = "ami-0e35ddab05955cf57" # Ubuntu 22.04 in ap-south-1
instance_type = "t2.micro"
key_name      = "key_pair"    # Replace with your actual key pair name
name_prefix   = "dev"
