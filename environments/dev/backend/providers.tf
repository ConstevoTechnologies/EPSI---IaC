terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  subscription_id = "2672c5f5-deb5-431e-9f9d-9a4cd3161ef8"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}