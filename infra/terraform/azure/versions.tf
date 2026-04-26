terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm    = { source = "hashicorp/azurerm",    version = "~> 4.5" }
    azuread    = { source = "hashicorp/azuread",    version = "~> 3.0" }
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.32" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.15" }
    random     = { source = "hashicorp/random",     version = "~> 3.6" }
  }
  backend "azurerm" {
    resource_group_name  = "riskshield-tfstate"
    storage_account_name = "riskshieldtfstate"
    container_name       = "tfstate"
    key                  = "riskshield/azure/terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
  }
}
