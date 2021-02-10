
resource "azurerm_virtual_machine_extension" "wvdhost_amdgpu" {
  count                = var.vm.gpu_driver == "amd" ? 1 : 0
  virtual_machine_id   = azurerm_windows_virtual_machine.wvdhost.id
  name                 = "AmdGpuDriverWindows"
  publisher            = "Microsoft.HpcCompute"
  type                 = "AmdGpuDriverWindows"
  type_handler_version = "1.0"
  depends_on = [
    azurerm_virtual_machine_extension.wvdhost_hpjoin,
  ]
  lifecycle {
    ignore_changes = all
  }
}
