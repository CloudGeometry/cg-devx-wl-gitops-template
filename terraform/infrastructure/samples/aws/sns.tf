module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "<WL_NAME>-sns"

  tags = {
    Environment = "dev"
  }
}
