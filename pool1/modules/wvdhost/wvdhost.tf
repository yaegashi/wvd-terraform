
resource "azurerm_windows_virtual_machine" "wvdhost" {
  location            = var.vm.location
  resource_group_name = var.vm.resource_group_name
  name                = var.vm.name
  size                = var.vm.size
  //  source_image_id       = var.vm.image_id
  license_type          = var.vm.license_type
  network_interface_ids = [azurerm_network_interface.wvdhost.id]
  admin_username        = "banaadmin"
  admin_password        = random_password.wvdhost.result
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.vm.storage_account_type
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    owner = var.owner
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"

  }
  lifecycle {
    ignore_changes = [name, size, source_image_id, license_type, admin_username, admin_password, os_disk, identity, tags]
  }
}

resource "azurerm_network_interface" "wvdhost" {
  location            = var.vm.location
  resource_group_name = var.vm.resource_group_name
  name                = var.vm.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vm.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    owner = var.owner
  }
  lifecycle {
    ignore_changes = [ip_configuration, tags]
  }
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "wvdhost" {
  location              = var.vm.location
  virtual_machine_id    = azurerm_windows_virtual_machine.wvdhost.id
  enabled               = true
  daily_recurrence_time = "2200"
  timezone              = "Tokyo Standard Time"
  notification_settings {
    enabled = false
  }
  lifecycle {
    ignore_changes = all
  }
}

resource "random_password" "wvdhost" {
  length  = 16
  special = true
}
