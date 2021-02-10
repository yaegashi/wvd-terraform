resource "azurerm_resource_group" "wvd" {
  location = var.wvd.location
  name     = var.wvd.name
}

resource "azurerm_virtual_desktop_host_pool" "wvd" {
  location            = var.wvd.location
  resource_group_name = var.wvd.name
  name                = var.wvd.name
  friendly_name       = var.wvd.name
  type                = "Pooled"
  load_balancer_type  = "BreadthFirst"
  registration_info {
    expiration_date = var.wvd.expiration_date
  }
  depends_on = [azurerm_resource_group.wvd]
}

resource "azurerm_virtual_desktop_application_group" "wvd" {
  location            = var.wvd.location
  resource_group_name = var.wvd.name
  name                = var.wvd.name
  friendly_name       = var.wvd.name
  description         = "default desktop"
  type                = "Desktop"
  host_pool_id        = azurerm_virtual_desktop_host_pool.wvd.id
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "wvd" {
  workspace_id         = var.wvd.workspace_id
  application_group_id = azurerm_virtual_desktop_application_group.wvd.id
}
