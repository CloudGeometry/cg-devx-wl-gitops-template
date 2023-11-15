terraform {
  # Remote backend configuration
  # <TF_WL_SECRETS_REMOTE_BACKEND>

  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
}

# Vault configuration
provider "vault" {
}