resource "azurerm_virtual_network" "hub_vnet" {
  name                = var.hub_subnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.hub_subnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "hub_subnet" {
  name                 = var.hub_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  address_prefixes     = var.hub_subnet_address_space
}