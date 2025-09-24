resource "aws_s3_bucket" "logs_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true

  tags = {
    Name = "logs-bucket-${var.stage}"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.logs_bucket.id
  acl    = "private"
}

# Lifecycle rule: Delete logs after 7 days
resource "aws_s3_bucket_lifecycle_configuration" "logs_lifecycle" {
  bucket = aws_s3_bucket.logs_bucket.id

  rule {
    id     = "delete-old-logs"
    status = "Enabled"

    expiration {
      days = 7
    }

    filter {
      prefix = "logs/"
    }
  }
}
