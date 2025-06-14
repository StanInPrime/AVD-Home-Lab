resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "hub-to-spoke"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.hub_spoke_name
  remote_virtual_network_id = var.spoke_vnet_id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "spoke-to-hub"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.spoke_hub_name
  remote_virtual_network_id = var.hub_spoke_name
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
}