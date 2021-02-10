resource "azurerm_virtual_machine_extension" "wvdhost_admin" {
  virtual_machine_id   = azurerm_windows_virtual_machine.wvdhost.id
  name                 = "CustomScriptExtension"
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  settings = jsonencode({
    commandToExecute = "net localgroup administrators ${var.owner} /add"
    timestamp        = 3
  })
  protected_settings = jsonencode({})
  depends_on = [
    azurerm_virtual_machine_extension.wvdhost_adjoin,
  ]
  lifecycle {
    ignore_changes = all
  }
}
