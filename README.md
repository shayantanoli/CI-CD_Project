# One-Click DevOps Pipeline

Jenkins pipeline that provisions an Azure Ubuntu VM with Terraform,
configures Apache with Ansible, deploys a static site, and verifies it with curl.

## Stack
- Jenkins (Docker) — CI/CD orchestration
- Terraform — provisions Azure VM, VNet, Subnet, Public IP, NSG
- Ansible — installs Apache, deploys the site
- Azure — cloud infrastructure (koreacentral)

## Pipeline Stages
1. Checkout code from GitHub
2. Terraform init / plan / apply
3. Generate dynamic Ansible inventory from Terraform output
4. Wait for SSH availability
5. Ansible: install Apache + deploy site
6. Verify with curl

## Cleanup
    az group delete --name devops-project-rg --yes --no-wait

## Author
Shayan — DevOps Final Project
