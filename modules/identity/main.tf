data azurerm_client_config "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  sku_name                    = var.sku_name
  purge_protection_enabled    = var.purge_protection_enabled

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

secret_permissions = ["Get", "list", "set", "delete"]
  }

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "vm_assigned_identity" {
  location            = var.location
  name                = var.name_assigned_identity
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "keyvault_access" {
  scope                = var.scope
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.vm_assigned_identity.id
}


