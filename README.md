# 🔧 Terraform AWS EC2 Module Demo

**Production-ready Terraform modules** - VPC + Security Group + EC2 deployment

## 🏗️ Architecture
VPC (10.0.0.0/16)
├── Public Subnet (10.0.1.0/24)
├── Internet Gateway + Route Table
├── Security Group (SSH:22, HTTP:80)
└── EC2 t2.micro (Amazon Linux 2)


## 📁 Modular Structure
├── modules/
│ ├── vpc/ # Reusable VPC module
│ ├── security-group/ # SSH+HTTP rules
│ └── ec2/ # EC2 instance
├── main.tf # Module wiring
├── variables.tf # Inputs
└── outputs.tf # VPC ID, Public IP

## 🚀 Quick Start
```bash
# Configure AWS credentials
aws configure

# Terraform workflow
terraform init
terraform validate
terraform plan
terraform apply
