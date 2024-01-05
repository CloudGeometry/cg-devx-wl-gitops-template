# dev environment secrets template
resource "vault_generic_secret" "<WL_NAME>_<WL_SERVICE_NAME>-dev" {
  path      = "workloads/<WL_NAME>/dev/<WL_SERVICE_NAME>"
  # note: do not hardcode passwords in git under normal circumstances.
  data_json = <<EOT
{
  "secret_key": "dev env secret value placeholder"
}
EOT

  lifecycle {
    ignore_changes = [
      data_json
    ]
  }
}

# staging environment secrets template
resource "vault_generic_secret" "<WL_NAME>_<WL_SERVICE_NAME>-sta" {
  path      = "workloads/<WL_NAME>/sta/<WL_SERVICE_NAME>"
  # note: do not hardcode passwords in git under normal circumstances.
  data_json = <<EOT
{
  "secret_key": "sta env secret value placeholder"
}
EOT

  lifecycle {
    ignore_changes = [
      data_json
    ]
  }
}

# prod environment secrets template
resource "vault_generic_secret" "<WL_NAME>_<WL_SERVICE_NAME>-prod" {
  path      = "workloads/<WL_NAME>/prod/<WL_SERVICE_NAME>"
  # note: do not hardcode passwords in git under normal circumstances.
  data_json = <<EOT
{
  "secret_key": "prod env secret value placeholder"
}
EOT

  lifecycle {
    ignore_changes = [
      data_json
    ]
  }
}
