#!/bin/bash
# Stage variable passed from Terraform
STAGE="${STAGE:-dev}"   # default to dev

# Update system
sudo yum update -y

# Install Java 21, Maven & Git
sudo amazon-linux-extras enable corretto21 -y
sudo yum install -y java-21-amazon-corretto maven git

# Clone repo
git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git /home/ec2-user/app
cd /home/ec2-user/app

# Stage-based configuration
if [ "$STAGE" == "prod" ]; then
    cp prod_config application.properties
else
    cp dev_config application.properties
fi

# Build & run Java app
mvn clean package
nohup java -jar target/techeazy-devops-0.0.1-SNAPSHOT.jar --server.port=80 &

# Verify app is reachable (optional)
if nc -zv 127.0.0.1 80; then
    echo "Application running on port 80"
else
    echo "Application failed to start"
fi

# Auto stop EC2 after 2 hours for cost saving
sudo shutdown -h +120
