locals {
  #network
  prefix      = "avd"
  environment = "dev"
  location    = "uksouth"

  #network
  rg_name     = "${local.prefix}-rg-${local.environment}-${random_integer.suffix.result}"
  vnet_name   = "${local.prefix}-vnet-${local.environment}-${random_integer.suffix.result}"
  subnet_name = "${local.prefix}-subnet-${local.environment}-${random_integer.suffix.result}"

  #hub network 
  hub_vnet_name   = "${local.prefix}-hub-vnet-${local.environment}-${random_integer.suffix.result}"
  hub_subnet_name = "${local.prefix}-hub-subnet-${local.environment}-${random_integer.suffix.result}"

  # identity
  name_assigned_identity = "uai-${local.prefix}-${local.environment}"
  key_vault_name         = "${local.prefix}-kv-${local.environment}-${random_integer.suffix.result}"

  ## AVD 
  description                 = "Default host pool description"
  desktop_app_group_name      = "${local.prefix}-desktop_app_group-${local.environment}-${random_integer.suffix.result}"
  type                        = "Pooled"
  host_pool_name              = "${local.prefix}-hostpool-${local.environment}-${local.location}-${random_integer.suffix.result}"
  workspace                   = "${local.prefix}-workspace-${local.environment}-${local.location}-${random_integer.suffix.result}"
  remoteapp_name              = "${local.prefix}-remoteapp-${local.environment}-${random_integer.suffix.result}"
  load_balancer_type          = "BreadthFirst"
  custom_rdp_properties       = "audiocapturemode:i:1;audiomode:i:0;"
  friendly_name               = "Testing Host Pool IaC"
  host_pool_registration_info = "2025-06-21T18:00:00Z"

  ## Storage
  storage_name = "${local.prefix}-storage-${local.environment}-${local.location}-${random_integer.suffix.result}"
  account_tier = "Standard"
  account_replication_type = "LRS"
  file_share_name = "FSLogix"

 ## resource_group_name = 

  ## ${local.prefix}-rg-{local.environment}{random_integer.suffix.result}

  tags = {
    owner        = "stan"
    environment  = local.environment
    project_name = "avd-lab"
  }
}

