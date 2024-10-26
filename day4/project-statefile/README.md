# Terraform State Management with S3 and DynamoDB

This document provides a brief overview of using an S3 bucket for Terraform state file storage and employing DynamoDB for state locking.

## What is Terraform State?

Terraform maintains a state file that keeps track of the resources it manages. This state file is crucial for mapping your configuration to real-world resources and helps Terraform understand the current infrastructure.

## Using S3 as a Backend

**S3 Backend**: Storing the Terraform state file in an S3 bucket enhances durability and availability. This setup allows multiple users to share the same state file without conflicts.

### Configuration Example

To configure the S3 backend, create an S3 bucket (e.g., `ankiths3bucket-statefile`) and use the following configuration in your `backend.tf` file:

```hcl
terraform {
  backend "s3" {
    bucket = "ankiths3bucket-statefile"
    key    = "terraform.tfstate"
    region = "us-west-2"  # Specify your AWS region
  }
}
```
### dont add backend.tf while you paln and apply add this at last just add terraform init after all configuration 
### just change your s3 bucket name as aws region 
### for locking system with dynamo db 
- create 2 terminal
- in that simultaneously run terraform apply 
- in termainal that work in other termainalit wont it shows error about lock


## happy learning love you 