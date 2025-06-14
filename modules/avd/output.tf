## ./modules/avd/output.tf


output "pooledbreadthfirst" {
  value = azurerm_virtual_desktop_host_pool.pooledbreadthfirst.id
}

output "workspace_id" {
  value = azurerm_virtual_desktop_workspace.workspace.id
}

output "remoteapp_id" {
  value = azurerm_virtual_desktop_application_group.remoteapp.id
}

