
# Terraform Infrastructure Project (infra)

This repository defines a modular and environment-specific infrastructure-as-code setup using Terraform. It is designed to provision and manage AWS resources in a scalable and reusable manner.

## 📁 Project Structure

`
terraform-infra/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf          # Remote state backend for dev
│
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── backend.tf          # Remote state backend for prod
│
├── modules/
│   ├── vpc/
│   │   ├── main.tf             # aws_vpc
│   │   ├── variables.tf
│   │   └── outputs.tf
│
│   ├── subnets/
│   │   ├── main.tf             # aws_subnet (public/private)
│   │   ├── variables.tf
│   │   └── outputs.tf
│
│   ├── internet_gateway/
│   │   ├── main.tf             # aws_internet_gateway
│   │   ├── variables.tf
│   │   └── outputs.tf
│
│   ├── nat_gateway/
│   │   ├── main.tf             # aws_nat_gateway & elastic IP
│   │   ├── variables.tf
│   │   └── outputs.tf
│
│   ├── route_tables/
│   │   ├── main.tf             # aws_route_table, routes, associations
│   │   ├── variables.tf
│   │   └── outputs.tf
│
│   ├── security_groups/
│   │   ├── main.tf             # aws_security_group rules
│   │   ├── variables.tf
│   │   └── outputs.tf
│
│   └── ec2/
│       ├── main.tf             # aws_instance for bastion or app
│       ├── variables.tf
│       └── outputs.tf
│
├── provider.tf                 # Common provider config (optional if each env has one)
└── README.md                   # Project documentation
`
## 🌐 Environments

Each environment (`dev`, `prod`) has its own:

- `main.tf`: Imports modules and resources.
- `variables.tf`: Declares required variables.
- `terraform.tfvars`: Supplies values for those variables.
- `backend.tf`: Stores remote state in a backend like S3.

## 📦 Modules

Modules are reusable units of Terraform configuration. This project has the following modules:

- **VPC**: Creates an isolated network using `aws_vpc`.
- **EC2**: Deploys compute instances using `aws_instance`.

## 🚀 How to Use

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
