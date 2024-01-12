# AWS S3 bucket with versioning
# For more details please see official provider documentation https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "<WL_NAME>-example-bucket"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = merge(local.tags, {
    Name        = "<WL_NAME>-example-bucket",
    Environment = "dev"
  })
}
