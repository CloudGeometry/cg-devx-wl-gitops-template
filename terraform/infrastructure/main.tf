terraform {
  # Remote backend configuration
  # <TF_WL_HOSTING_REMOTE_BACKEND>
}

# Cloud Provider configuration
# <TF_HOSTING_PROVIDER>

locals {
  region       = "<CLOUD_REGION>"
  wl_name      = "<WL_NAME>"
  domain_name  = "<DOMAIN_NAME>"
  cluster_name = "<CLUSTER_NAME>"
  owner_email  = "<OWNER_EMAIL>"
  tags = {
    "cg-devx.cost-allocation.workload"    = "<WL_NAME>"
    "cg-devx.cost-allocation.cost-center" = "development"
    "cg-devx.metadata.owner"              = "<WL_NAME>-admins.<WL_NAME>-developers"
    "provisioned-by"                      = "cg-devx"
  }
}
