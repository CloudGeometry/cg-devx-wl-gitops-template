# AWS S3 bucket with versioning
# For more details please see official provider documentation https://registry.terraform.io/modules/terraform-aws-modules/sns/aws/latest

module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "<WL_NAME>-sns"

  tags = {
    Environment = "dev"
  }
}
