/*resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}
*/

##root main 

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = local.location
  tags     = local.tags
}

module "network" {
  source               = "./modules/network"
  vnet_name            = local.vnet_name
  subnet_name          = local.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  vnet_address_space   = ["10.0.0.0/16"]
  subnet_address_space = ["10.0.1.0/24"]
  tags                 = local.tags
  depends_on           = [module.hub]
}

module "hub" {
  source                   = "./modules/hub"
  hub_vnet_name            = local.hub_vnet_name
  hub_subnet_name          = local.hub_vnet_name
  location                 = local.location
  resource_group_name      = azurerm_resource_group.rg.name
  hub_vnet_address_space   = ["10.1.1.0/16"]
  hub_subnet_address_space = ["10.1.0.0/24"]
  tags                     = local.tags
}

module "peering" {
  source              = "./modules/peering"
  hub_spoke_name      = module.hub.hub_vnet_name
  spoke_hub_name      = module.network.subnet_name
  hub_vnet_id         = module.hub.hub_vnet_id
  spoke_vnet_id       = module.network.vnet_id
  resource_group_name = azurerm_resource_group.rg.name
  depends_on          = [module.network]
}

module "identity" {
  source                     = "./modules/identity"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = local.location
  name_assigned_identity     = local.name_assigned_identity
  key_vault_name             = local.key_vault_name
  scope                      = azurerm_resource_group.rg.id
  sku_name                   = "Standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  tags                       = local.tags
}

module "avd" {
  source                   = "./modules/avd"
  description              = local.description
  desktop_app_group_name   = local.desktop_app_group_name
  type                     = local.type
  start_vm_on_connect      = true
  host_pool_name           = local.host_pool_name
  location                 = local.location
  resource_group_name      = azurerm_resource_group.rg.name
  validate_environment     = true
  workspace                = local.workspace
  expiration_date          = local.host_pool_registration_info
  maximum_sessions_allowed = 9999
  remoteapp_name           = local.remoteapp_name
  friendly_name            = local.friendly_name
  load_balancer_type       = local.load_balancer_type
  custom_rdp_properties    = local.custom_rdp_properties
}

module "storage" {
  source = "./modules/storage"
  storage_name = local.storage_name
  resource_group_name = "avd-storage"
  location = "UK South"
  account_tier = local.account_tier
  account_replication_type = local.account_replication_type
  file_share_name = local.file_share_name
  quota = 50
}






