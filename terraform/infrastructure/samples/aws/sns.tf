# AWS SNS and SQS
# For more details about SNS please see official provider documentation https://registry.terraform.io/modules/terraform-aws-modules/sns/aws/latest
# For more details about SQS please see official provider documentation https://registry.terraform.io/modules/terraform-aws-modules/sqs/aws/latest

module "sns" {
  source  = "terraform-aws-modules/sns/aws"
  version = ">= 5.0"

  name = "pub-sub"

  topic_policy_statements = {
    sqs = {
      sid = "SQSSubscribe"
      actions = [
        "sns:Subscribe",
        "sns:Receive",
      ]

      principals = [{
        type        = "AWS"
        identifiers = ["*"]
      }]

      conditions = [{
        test     = "StringLike"
        variable = "sns:Endpoint"
        values   = [module.sqs.queue_arn]
      }]
    }
  }

  subscriptions = {
    sqs = {
      protocol = "sqs"
      endpoint = module.sqs.queue_arn
    }
  }

  tags = {
    Environment = "dev"
  }
}

module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = "pub-sub"

  create_queue_policy = true
  queue_policy_statements = {
    sns = {
      sid     = "SNSPublish"
      actions = ["sqs:SendMessage"]

      principals = [
        {
          type        = "Service"
          identifiers = ["sns.amazonaws.com"]
        }
      ]

      conditions = [{
        test     = "ArnEquals"
        variable = "aws:SourceArn"
        values   = [module.sns.topic_arn]
      }]
    }
  }

  tags = {
    Environment = "dev"
  }
}
