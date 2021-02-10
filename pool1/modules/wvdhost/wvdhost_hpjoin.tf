
resource "azurerm_virtual_machine_extension" "wvdhost_hpjoin" {
  virtual_machine_id   = azurerm_windows_virtual_machine.wvdhost.id
  name                 = "Microsoft.Powershell.DSC"
  publisher            = "Microsoft.Powershell"
  type                 = "DSC"
  type_handler_version = "2.73"
  settings = jsonencode({
    modulesUrl            = var.hpjoin.url
    configurationFunction = "Configuration.ps1\\AddSessionHost"
    properties = {
      hostPoolName          = var.hpjoin.name
      registrationInfoToken = var.hpjoin.token
    }
  })
  depends_on = [
    azurerm_virtual_machine_extension.wvdhost_adjoin,
  ]
  lifecycle {
    ignore_changes = all
  }
}
