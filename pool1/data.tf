data "azurerm_subnet" "wvd" {
  resource_group_name  = "VNet"
  virtual_network_name = "VNet"
  name                 = "Pool1"
}
