output "hub_vnet_id" {
  value = azurerm_virtual_network_peering.hub_to_spoke.id
}

output "spoke_vnet_id" {
  value = azurerm_virtual_network_peering.spoke_to_hub.id
}
