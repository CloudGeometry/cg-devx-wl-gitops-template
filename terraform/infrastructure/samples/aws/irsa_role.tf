module "<CLUSTER_NAME>_<WL_NAME>_<WL_SERVICE_NAME>_irsa" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "<CLUSTER_NAME>-<WL_NAME>-<WL_SERVICE_NAME>-role"

  role_policy_arns = {
    policy = aws_iam_policy.<CLUSTER_NAME>_<WL_NAME>_<WL_SERVICE_NAME>.arn
  }

  oidc_providers = {
    main = {
      provider_arn               = "<CLUSTER_OIDC_PROVIDER_ARN>"
      namespace_service_accounts = [
        "wl-<WL_NAME>-dev:<WL_SERVICE_NAME>",
        "wl-<WL_NAME>-sta:<WL_SERVICE_NAME>",
        "wl-<WL_NAME>-prod:<WL_SERVICE_NAME>"
      ]
    }
  }
}

resource "aws_iam_policy" "<CLUSTER_NAME>_<WL_NAME>_<WL_SERVICE_NAME>" {
  name        = "<CLUSTER_NAME>-<WL_NAME>-<WL_SERVICE_NAME>-policy"
  description = "<CLUSTER_NAME>-<WL_NAME>-<WL_SERVICE_NAME> IAM policy"

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