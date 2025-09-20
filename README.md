7️⃣ README.md
# Techeazy DevOps Assignment

## Project Overview
Automates EC2 deployment of a Java 21 application using Terraform:

- Spins up EC2 instance
- Installs Java 21, Maven & Git
- Clones GitHub repo: https://github.com/Trainings-TechEazy/test-repo-for-devops
- Builds & runs Java app on port 80
- Stage-based configuration (Dev / Prod)
- Stops EC2 after 2 hours to save cost

---

## Folder Structure


terraform/ -> Terraform files
script/ -> EC2 bootstrap script (setup.sh)
.gitignore
README.md


---

## Prerequisites
- AWS free tier account
- AWS CLI configured
- Terraform installed
- Git installed

---

## Deployment Steps

1. Clone repo:
```bash
git clone https://github.com/<your-username>/TechEazyDevops-Assignment.git
cd TechEazyDevops-Assignment/terraform


Configure AWS:

aws configure


Initialize Terraform:

terraform init


Deploy EC2:

terraform apply -var="stage=dev"

Stage Selection

Deploy Dev or Prod stage:

terraform apply -var="stage=dev"
terraform apply -var="stage=prod"


dev → dev_config

prod → prod_config

Verification

Access app: http://<ec2-public-ip>/

Logs: SSH into EC2 and check nohup.out

Notes

No secrets in repo

EC2 auto-stops after 2 hours

Stage parameter selects config automatically


---

This **fully satisfies your assignment requirements**:

- EC2 provisioning  
- Java 21 + Maven + Git installation  
- Clone + build + run  
- Stage-based configuration  
- Auto shutdown  
- Scripts in separate folder  