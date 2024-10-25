## structure of module: it dived into 
- Main Module : The root directory where main.tf, variables.tf, and outputs.tf are defined
- Submodules: Directories (folders) inside the main module that have their own Terraform configurations (usually a main.tf, variables.tf, and outputs.tf).


We'll create a project with:

1. A VPC setup.
2. An EC2 instance in that VPC.
3. A security group to manage access.

```
project-root/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── security_group/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Modules Overview

### 1. VPC Module
- **Purpose**: Creates a Virtual Private Cloud (VPC) and subnet.
- **Variables**:
  - `cidr_block`: The CIDR block for the VPC.
  - `subnet_cidr`: The CIDR block for the subnet.
  - `availability_zone`: The Availability Zone for the subnet.
- **Outputs**:
  - `vpc_id`: The ID of the created VPC.
  - `subnet_id`: The ID of the created subnet.

### 2. Security Group Module
- **Purpose**: Creates a security group within the VPC.
- **Variables**:
  - `vpc_id`: The ID of the VPC where the security group will be created.
- **Outputs**:
  - `security_group_id`: The ID of the created security group.

### 3. EC2 Module
- **Purpose**: Launches an EC2 instance in the specified VPC and subnet.
- **Variables**:
  - `ami_id`: The Amazon Machine Image (AMI) ID for the instance.
  - `instance_type`: The instance type (e.g., `t2.micro`).
  - `subnet_id`: The ID of the subnet for the instance.
  - `key_pair`: The key pair for SSH access to the instance.
- **Outputs**:
  - `instance_id`: The ID of the created EC2 instance.
  - `public_ip`: The public IP address of the EC2 instance.

## Usage

### Step 1: Set Up `terraform.tfvars`

Create a `terraform.tfvars` file in the root directory to define values for the variables used in the root module.

```hcl
region            = "ap-south-1"
cidr_block        = "10.0.0.0/16"
subnet_cidr       = "10.0.1.0/24"
availability_zone = "ap-south-1a"
ami_id            = "ami-12345678"        # Replace with a valid AMI ID
instance_type     = "t2.micro"
key_pair          = "your-key-pair-name"  # Replace with your key pair name

#### Module: VPC

```
module "vpc" {
  source            = "./modules/vpc"         # Path to the VPC module
  cidr_block        = var.cidr_block          # Passes CIDR block as input to the module
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
}
```
#### Module: Security Group
```
module "security_group" {
  source = "./modules/security_group"         # Path to the security_group module
  vpc_id = module.vpc.vpc_id                  # Uses output from VPC module as input here
}

```
#### Module: EC2
```
module "ec2" {
  source        = "./modules/ec2"             # Path to the ec2 module
  ami_id        = var.ami_id                  # Passes AMI ID as input to the module
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id        # Uses output from VPC module as input here
  key_pair      = var.key_pair
}

```