terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"  # Mumbai region
}

# Automatically get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  # Pass stage variable and run setup.sh
  user_data = <<-EOF
    #!/bin/bash
    export STAGE=${var.stage}
    $(cat "${path.module}/../script/setup.sh")
  EOF

  tags = {
    Name = "techeazy-${var.stage}-server"
  }
}
