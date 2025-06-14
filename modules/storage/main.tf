resource "azurerm_resource_group" "storage_rg" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_storage_account" "storage" {
  name                     = var.storage_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_storage_share" "storage_share" {
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.storage.name
  quota                = var.quota
}