output "ec2_public_ip" {
  description = "Public IP of the deployed EC2 instance"
  value       = aws_instance.app_server.public_ip
}
