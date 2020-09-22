provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

terraform {
  required_providers {
    databricks = {
      source = "databrickslabs/databricks"
      version = "0.2.5"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name = "learning-tf-master-rg"
    storage_account_name = "tfstate0store"
    container_name = "testing-platform"
    key = "platform.tfstate"
  }
}