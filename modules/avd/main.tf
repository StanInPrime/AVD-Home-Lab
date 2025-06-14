## ./modules/avd/main.tf

data "azurerm_client_config" "client_config" {}
data "azurerm_subscription" "subscription" {}

resource "azurerm_virtual_desktop_host_pool" "pooledbreadthfirst" {
  location            = var.location
  resource_group_name = var.resource_group_name

  name                     = var.host_pool_name
  friendly_name            = var.friendly_name
  validate_environment     = var.validate_environment
  start_vm_on_connect      = var.start_vm_on_connect
  custom_rdp_properties    = var.custom_rdp_properties
  description              = var.description
  type                     = var.type
  maximum_sessions_allowed = var.maximum_sessions_allowed
  load_balancer_type       = var.load_balancer_type
  scheduled_agent_updates {
    enabled = true
    schedule {
      day_of_week = "Saturday"
      hour_of_day = 2
    }
  }
}

resource "azurerm_virtual_desktop_application_group" "remoteapp" {
  name                = var.remoteapp_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type          = "RemoteApp"
  host_pool_id  = azurerm_virtual_desktop_host_pool.pooledbreadthfirst.id
  friendly_name = var.friendly_name ##"TestAppGroup"
  description   = var.description ##"Acceptance Test: An application group"
}

resource "azurerm_virtual_desktop_application_group" "desktopapp" {
  name                = var.desktop_app_group_name
  location            = var.location
  resource_group_name = var.resource_group_name

  type          = "Desktop"
  host_pool_id  = azurerm_virtual_desktop_host_pool.pooledbreadthfirst.id
  friendly_name = var.friendly_name
  description   = var.description
}

resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.workspace
  location            = var.location
  resource_group_name = var.resource_group_name

  friendly_name = var.friendly_name
  description   = var.description
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "workspaceremoteapp" {
  workspace_id         = azurerm_virtual_desktop_workspace.workspace.id
  application_group_id = azurerm_virtual_desktop_application_group.remoteapp.id
}

resource "azurerm_virtual_desktop_host_pool_registration_info" "host_pool_registration_info" {
  hostpool_id     = azurerm_virtual_desktop_host_pool.pooledbreadthfirst.id
  expiration_date = var.expiration_date
}

resource "azurerm_role_assignment" "avd_role_assignment" {
  scope                = data.azurerm_subscription.subscription.id
  role_definition_name = "Virtual Machine Login"
  principal_id         = data.azurerm_client_config.client_config.id
}
