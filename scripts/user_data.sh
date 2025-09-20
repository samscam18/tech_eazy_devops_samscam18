#!/bin/bash
STAGE="${stage}"

# Update system
sudo yum update -y

# Install Java 21
sudo amazon-linux-extras enable corretto21
sudo yum install -y java-21-amazon-corretto

# Install Maven & git
sudo yum install -y maven git

# Clone app repo
git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git /home/ec2-user/app
cd /home/ec2-user/app

# Copy stage-specific config
if [ "$STAGE" == "prod" ]; then
    cp prod_config application.properties
else
    cp dev_config application.properties
fi

# Build and run app
mvn clean package
nohup java -jar target/techeazy-devops-0.0.1-SNAPSHOT.jar --server.port=80 &

# Auto shutdown after 2 hours
sudo shutdown -h +120
