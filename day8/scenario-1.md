## migration of terrform form aws
1. type-1
- change the field
```
# main.tf

provider "aws" {
  region = "us-east-1" # Change this to your desired region
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.micro"
}

# Command to import the existing EC2 instance
# Run this in your terminal after creating the main.tf file
# terraform import aws_instance.my_instance i-0b937d3e18efa42aa

```
#### Initialize Terraform: Run the following command again:
```
terraform init

```
#### Import the EC2 Instance: After initialization, run:
```
terraform import aws_instance.my_instance i-0b937d3e18efa42aa
```
#### Check the State: Use:
```
terraform state list
```
```
terraform plan
```
### now change the filed little bit it will give a statefile 
- agin modify your main.tf
```
resource "aws_instance" "my_instance" {
  ami           = "ami-0dee22c13ea7a9a67"
  instance_type = "t2.small"  # Change the instance type as desired
  key_name      = "jaya"       # Ensure this key exists in your account

  tags = {
    Name = "UpdatedName"      # Update the instance name
  }
}
```
### Run Terraform Plan: After making any changes, run the following command to see what Terraform will change:
```
terraform plan

```
### Apply Changes: If the plan looks good and shows the changes you want, apply them with
```
terraform apply

```

