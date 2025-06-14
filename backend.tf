terraform {
  backend "azurerm" {
    resource_group_name  = "rg-storage-uksouth"
    storage_account_name = "storagestatefile001"
    container_name       = "tfstate"
    key                  = "terraform.avdtfstate"
  }
}