module "<WL_SERVICE_NAME>_irsa" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "${local.cluster_name}-${local.wl_name}-<WL_SERVICE_NAME>-role"

  role_policy_arns = {
    policy = aws_iam_policy.<WL_SERVICE_NAME>.arn
  }

  oidc_providers = {
    main = {
      provider_arn               = "<CLUSTER_OIDC_PROVIDER_ARN>"
      namespace_service_accounts = [
        "wl-${local.wl_name}-dev:<WL_SERVICE_NAME>",
        "wl-${local.wl_name}-sta:<WL_SERVICE_NAME>",
        "wl-${local.wl_name}-prod:<WL_SERVICE_NAME>"
      ]
    }
  }
}

resource "aws_iam_policy" "<WL_SERVICE_NAME>" {
  name        = "${local.cluster_name}-${local.wl_name}-<WL_SERVICE_NAME>-policy"
  description = "${local.cluster_name}-${local.wl_name}-<WL_SERVICE_NAME> IAM policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "EmptyPolicy",
        "Effect" : "Allow",
        "Action" : "none:null",
        "Resource" : "*"
      }
    ]
  })
}