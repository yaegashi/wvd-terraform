resource "azurerm_resource_group" "workspace" {
  name     = var.workspace.name
  location = var.workspace.location
}

resource "azurerm_virtual_desktop_workspace" "workspace" {
  name                = var.workspace.name
  location            = azurerm_resource_group.workspace.location
  resource_group_name = azurerm_resource_group.workspace.name
}
