terraform {
  # Remote backend configuration
  # <TF_WL_HOSTING_REMOTE_BACKEND>
}

# Cloud Provider configuration
# <TF_HOSTING_PROVIDER>

locals {
  region                       = "<CLOUD_REGION>"
  wl_name                      = "<WL_NAME>"
  domain_name                  = "<DOMAIN_NAME>"
  cluster_name                 = "<PRIMARY_CLUSTER_NAME>"
  owner_email                  = "<OWNER_EMAIL>"
  tags = {
    Workload   = "<WL_NAME>"
    ProvisionedBy = "CGDevX"
  }
}
