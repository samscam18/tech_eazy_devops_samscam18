TechEazy DevOps Assignment
Project Overview
This project automates the "lift and shift" deployment of a sample Java application to an AWS EC2 instance. It simulates a real-world scenario where infrastructure is provisioned and an application is deployed in an automated, repeatable manner using Infrastructure as Code (IaC) with Terraform and Bash scripts.

After completing Assignment 2, the project now includes an additional Terraform module to manage further AWS infrastructure components efficiently.

Core Features
Automated Deployment: A single command provisions an EC2 instance, installs dependencies, and deploys the Java application automatically.

Port 80 Accessibility: The application is accessible on port 80 via Nginx reverse proxy.

Cost Savings: EC2 instances are scheduled to shut down after a period to avoid unnecessary costs.

Configurable by Stage: Deployment supports different environments (e.g., dev or prod) using wrapper scripts and .tfvars files.

Extended Terraform Modules: Added support for additional AWS resources and configurations in terraform/assignment-2 after completing Assignment 2.

Prerequisites
AWS CLI configured with valid IAM credentials.

Terraform version 1.0 or greater.

Git installed and configured.

Deployment Instructions
Clone the repository:

bash
git clone https://github.com/samscam18/tech_eazy_devops_samscam18.git
Create AWS Key Pair:

Go to the AWS console in us-east-1 region and create a key pair named techeazy-devops-new-key. Download the .pem file and save securely.

Run Deployment Scripts:

For the original deployment:

bash
./deploy.sh dev
# or
./deploy.sh prod
For the extended deployment with Assignment 2 resources:

Provision terraform modules inside terraform/assignment-2 as needed.

Project Structure
text
.
├── deploy.sh
├── README.md
├── scripts/
│   └── user_data.sh
└── terraform/
    ├── dev.tfvars
    ├── main.tf
    ├── outputs.tf
    ├── prod.tfvars
    ├── variables.tf
    └── assignment-2/
        ├── iam.tf
        ├── main.tf
        ├── output.tf
        ├── s3.tf
        ├── script/
        │   └── upload_logs.sh
        └── variables.tf
Validation
After running the deployment, Terraform will output the public IP of the EC2 instance. Navigate to:

text
http://<public_ip>
to verify the Java application is running correctly.

If you want help creating the actual README.md file and committing it to your repo, I can guide you through those steps.Here is the updated README content reflecting the changes after completing assignment 2. You can copy this into your README.md file:

TechEazy DevOps Assignment
Project Overview
This project automates the "lift and shift" deployment of a sample Java application to an AWS EC2 instance. It simulates a real-world scenario where infrastructure is provisioned and an application is deployed in an automated, repeatable manner using Infrastructure as Code (IaC) with Terraform and Bash scripts.

After completing Assignment 2, the project now includes an additional Terraform module to manage further AWS infrastructure components efficiently.

Core Features
Automated Deployment: A single command provisions an EC2 instance, installs dependencies, and deploys the Java application automatically.

Port 80 Accessibility: The application is accessible on port 80 via Nginx reverse proxy.

Cost Savings: EC2 instances are scheduled to shut down after a period to avoid unnecessary costs.

Configurable by Stage: Deployment supports different environments (e.g., dev or prod) using wrapper scripts and .tfvars files.

Extended Terraform Modules: Added support for additional AWS resources and configurations in terraform/assignment-2 after completing Assignment 2.

Prerequisites
AWS CLI configured with valid IAM credentials.

Terraform version 1.0 or greater.

Git installed and configured.

Deployment Instructions
Clone the repository:

bash
git clone https://github.com/samscam18/tech_eazy_devops_samscam18.git
Create AWS Key Pair:

Go to AWS console in us-east-1 region and create a key pair named techeazy-devops-new-key. Download the .pem file and save securely.

Run Deployment Scripts:

For original deployment:

bash
./deploy.sh dev
# or
./deploy.sh prod
For extended resources in Assignment 2:

Provision terraform modules inside terraform/assignment-2 as needed.

Project Structure
text
.
├── deploy.sh
├── README.md
├── scripts/
│   └── user_data.sh
└── terraform/
    ├── dev.tfvars
    ├── main.tf
    ├── outputs.tf
    ├── prod.tfvars
    ├── variables.tf
    └── assignment-2/
        ├── iam.tf
        ├── main.tf
        ├── output.tf
        ├── s3.tf
        ├── script/
        │   └── upload_logs.sh
        └── variables.tf
Validation
After deployment, Terraform outputs the EC2 public IP. Open:

text
http://<public_ip>
to verify the Java application runs correctly.