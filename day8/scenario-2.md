# Terraform EC2 Instance Creation with Count Parameter

This project demonstrates how to use Terraform to provision multiple Amazon EC2 instances using a specified Amazon Machine Image (AMI) in the `ap-south-1` (Mumbai) region. It highlights the use of the `count` parameter to control the number of instances created dynamically.

## Prerequisites

Before you begin, ensure you have the following:

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- An active AWS account with necessary permissions to create EC2 instances.
- AWS credentials configured (either through environment variables, AWS configuration files, or IAM roles).

## Directory Structure

```
# Specify the required provider
provider "aws" {
  region = "ap-south-1"  # Mumbai region
}

# Create 5 EC2 instances
resource "aws_instance" "example" {
  ami           = "ami-0dee22c13ea7a9a67"  # Your specified AMI
  instance_type = "t2.micro"               # Instance type

  count = 5  # Setting count to 5, so 5 instances will be created

  # Adding tags for identification
  tags = {
    Name = "MyEC2Instance-${count.index}"  # Unique naming using index
  }
}
```
### id we count as 0 (zero) i will not create any infra
