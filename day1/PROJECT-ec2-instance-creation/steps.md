# Overview of steps

Create a directory for your Terraform project and create a Terraform configuration file (usually named `main.tf`) in that directory. In this file, you define the AWS provider and resources you want to create. Here's a basic example:

```hcl
  provider "aws" {
  region = "ap-south-1"  # You can change this to your desired region
}

resource "aws_instance" "terraform_instance" {
  ami           = "ami-0dee22c13ea7a9a67"    # Replace with your AMI ID
  instance_type = "t2.micro"        # Choose the instance type you need

  key_name      = "jaya"            # Key pair name

  tags = {
    Name = "terraform"              # Name tag for the EC2 instance
  }

  # Optional: Security group to allow SSH access (port 22)
  security_groups = ["default"]      # You can create a security group if needed
}

output "instance_id" {
  value = aws_instance.terraform_instance.id
}

output "instance_public_ip" {
  value = aws_instance.terraform_instance.public_ip
}

```

## Initialize Terraform**

In your terminal, navigate to the directory containing your Terraform configuration files and run:

```
terraform init
```

This command initializes the Terraform working directory, downloading any necessary provider plugins.

## Apply the Configuration

Run the following command to create the AWS resources defined in your Terraform configuration:

```
terraform apply
```

Terraform will display a plan of the changes it's going to make. Review the plan and type "yes" when prompted to apply it.

## Verify Resources

After Terraform completes the provisioning process, you can verify the resources created in the AWS Management Console or by using AWS CLI commands.

## Destroy Resources

If you want to remove the resources created by Terraform, you can use the following command:

```
terraform destroy
```

Be cautious when using `terraform destroy` as it will delete resources as specified in your Terraform configuration.