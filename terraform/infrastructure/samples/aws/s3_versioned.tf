# AWS S3 bucket with versioning
# For more details please see official provider documentation https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

# random suffix for artifacts s3 bucket
resource "random_string" "random_suffix" {
  length  = 8
  lower   = true
  upper   = false
  special = false
}

# s3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${random_string.random_suffix.id}"

  tags = {
    Name        = "My example bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}