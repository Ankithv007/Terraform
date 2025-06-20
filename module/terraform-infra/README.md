
# Terraform AWS Multi-AZ High Availability Infrastructure

This project creates a highly available infrastructure setup on AWS using Terraform. It follows industry best practices including multi-AZ architecture, NAT Gateway, and public/private subnets. The setup is modular, reusable, and built for both `dev` and `prod` environments.

---

## 📐 Architecture Diagram

```
╔════════════════════════════════════════════════════════════════════╗
║                             AWS VPC                               ║
║                       CIDR: 10.0.0.0/16                            ║
║                                                                   
║                      ┌──────────────────────┐                     
║                      │  Internet (0.0.0.0/0) │                    
║                      └────────────┬─────────┘                     
║                                   │                                
║                           ┌───────▼────────┐                       
║                           │   Internet     │                       
║                           │   Gateway (IGW)│                       
║                           └───────┬────────┘                       
║                                   │                                
║       ┌───────────────────────────┼────────────────────────────┐   
║       │                           │                            │   
║       ▼                           ▼                            ▼   
║ ┌──────────────┐       ┌──────────────────┐          ┌──────────────────┐
║ │ Public Route │       │  Public Subnet 1a│          │  Public Subnet 1b│
║ │ Table        │◄──────┤ 10.0.1.0/24       │          │ 10.0.2.0/24       │
║ │ 0.0.0.0/0 → IGW│     │ Bastion EC2       │          │ NAT Gateway      │
║ └──────────────┘       └────────▲──────────┘          └────────▲──────────┘
║                                 │                               │
║                       ssh access from internet         EIP for Internet
║                                                          access for NAT
║                                                                   
║       ┌────────────────────────────┬────────────────────────────┐   
║       ▼                            ▼                            ▼   
║ ┌──────────────┐        ┌────────────────────┐        ┌────────────────────┐
║ │ Private Route│        │ Private Subnet 1a  │        │ Private Subnet 1b  │
║ │ Table        │◄───────┤ 10.0.3.0/24         │        │ 10.0.4.0/24         │
║ │ 0.0.0.0/0 → NAT GW│    │ App Server EC2     │        │ (reserved or unused)│
║ └──────────────┘        └────────────────────┘        └────────────────────┘
║                                                                   
╚════════════════════════════════════════════════════════════════════╝
```

---

## 🔁 Flow Summary

1. **Public Subnets (1a, 1b)**:
    - Subnet 1a: Contains **Bastion EC2**
    - Subnet 1b: Contains **NAT Gateway**

2. **Private Subnets (1a, 1b)**:
    - Subnet 1a: Contains **App EC2**
    - Subnet 1b: Reserved for future use

3. **Route Tables**:
    - **Public Route Table** → IGW (for internet access)
    - **Private Route Table** → NAT Gateway (for outbound access)

4. **Access Flow**:
    - Admins connect to **Bastion EC2** using SSH
    - Bastion can access App EC2 in the private subnet
    - App EC2 uses NAT Gateway for outbound internet (e.g., to install updates)

---

## 🗂 Modules Used

- `vpc` – Creates the VPC
- `subnets` – Creates public/private subnets across two AZs
- `internet_gateway` – Attaches IGW to VPC
- `nat_gateway` – Provisions Elastic IP and NAT Gateway
- `route_tables` – Configures and associates route tables
- `security_groups` – Creates SG for Bastion and App EC2
- `ec2` – Deploys EC2 instances

---

## 🚀 How to Deploy

### 1. Configure backend and variables
Edit `terraform.tfvars` in `environments/dev` and `environments/prod`.

### 2. Initialize
```bash
terraform init
```

### 3. Plan
```bash
terraform plan
```

### 4. Apply
```bash
terraform apply
```

---

## 🧪 Tested On

- Terraform v1.6+
- AWS CLI configured with IAM credentials
- Ubuntu 22.04 AMI (ap-south-1)
- t2.micro instance type (free tier eligible)

---

## 👨‍💻 Author

Ankith BV 
