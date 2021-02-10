module "yaegashi" {
  source = "./modules/wvdhost"
  owner  = "yaegashi@l0wdev.onmicrosoft.com"
  vm = {
    location             = "japaneast"
    resource_group_name  = azurerm_resource_group.wvd.name
    name                 = "wvd-yaegashi1"
    size                 = "Standard_D2as_v4"
    storage_account_type = "Premium_LRS"
    license_type         = "Windows_Client"
    image_publisher      = "MicrosoftWindowsServer"
    image_offer          = "WindowsServer"
    image_sku            = "2019-Datacenter"
    image_version        = "latest"
    image_id             = ""
    subnet_id            = data.azurerm_subnet.wvd.id
    gpu_driver           = ""
  }
  adjoin = var.adjoin
  hpjoin = {
    name  = azurerm_virtual_desktop_host_pool.wvd.name
    token = azurerm_virtual_desktop_host_pool.wvd.registration_info[0].token
    url   = var.hpjoin.url
  }
  agjoin = {
    id = azurerm_virtual_desktop_application_group.wvd.id
  }
}
