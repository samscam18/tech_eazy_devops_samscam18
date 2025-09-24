variable "stage" {
  description = "Deployment stage (e.g. dev, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create (must be unique)"
  type        = string
  validation {
    condition     = length(var.s3_bucket_name) > 0
    error_message = "S3 bucket name must be provided and not empty"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
