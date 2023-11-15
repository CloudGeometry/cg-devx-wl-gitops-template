resource "vault_generic_secret" "<WL_NAME>_[PUT_YOUR_ENV_NAME]" {
  path = "secret/<WL_NAME>/[PUT_YOUR_ENV_NAME]"
  # note: do not hardcode passwords in git under normal circumstances.
  data_json = <<EOT
{
  "SECRET_VALUE_ONE" : "<WL_NAME> secret a",
  "SECRET_VALUE__TWO" : "<WL_NAME> secret b"
}
EOT

  lifecycle {
    ignore_changes = [
      data_json
    ]
  }
}
