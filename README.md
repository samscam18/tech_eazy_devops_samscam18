TechEazy DevOps Assignment
Project Overview
This project automates the "lift and shift" deployment of a sample Java application to an AWS EC2 instance. It simulates a real-world scenario where infrastructure is provisioned and an application is deployed in an automated, repeatable manner. The solution uses Infrastructure as Code (IaC) with Terraform and a Bash script for deployment.




Core Features

Automated Deployment: A single command provisions an EC2 instance, installs all dependencies, and deploys the application.


Port 80 Accessibility: The application is made accessible on port 80 by configuring Nginx as a reverse proxy.


Cost Savings: The EC2 instance is automatically scheduled to shut down after a set time to prevent unnecessary costs.


Configurable by Stage: The deployment can be executed for different environments (e.g., dev or prod) using a simple wrapper script and a .tfvars file.

Prerequisites
To run this project, you need the following tools installed and configured on your local machine:

AWS CLI: Configured with valid IAM user credentials.

Terraform: Version 1.0 or higher.

Git

Deployment Instructions
Follow these steps to deploy the application to your AWS account.

Clone the repository: Clone this project repository to your local machine.

Bash

git clone https://github.com/tech_eazy_devops_<your-github-username>.git

Create a key pair: Go to your AWS console, switch to the us-east-1 region, and create a key pair named techeazy-devops-new-key. Save the downloaded 

.pem file and ensure it is in a secure location.

Run the deployment script: Execute the deploy.sh script from the root of the project, specifying the desired stage (dev or prod). This will provision the infrastructure and deploy the application.

Bash

# Deploy for the development environment
./deploy.sh dev

# Deploy for the production environment
./deploy.sh prod
Confirm the deployment: When prompted by Terraform, type yes to confirm the plan and start the deployment.

Validation
After the 

terraform apply command is complete, the public IP address of the EC2 instance will be displayed in the terminal output.

To check if the application is running, open a web browser and navigate to the following URL:
http://<public_ip>

Project Files
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
    └── variables.tf
