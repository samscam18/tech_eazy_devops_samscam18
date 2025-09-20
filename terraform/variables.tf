variable "stage" {
  description = "Deployment stage: dev or prod"
  type        = string
  default     = "dev"
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
}
