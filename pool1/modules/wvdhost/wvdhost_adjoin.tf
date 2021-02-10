resource "azurerm_virtual_machine_extension" "wvdhost_adjoin" {
  virtual_machine_id   = azurerm_windows_virtual_machine.wvdhost.id
  name                 = "JsonADDomainExtension"
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"
  settings = jsonencode({
    Name    = var.adjoin.domain
    User    = "${var.adjoin.name}@${var.adjoin.domain}"
    Restart = "true"
    Options = "3"
  })
  protected_settings = jsonencode({
    Password = var.adjoin.password
  })
  lifecycle {
    ignore_changes = [name]
  }
}
