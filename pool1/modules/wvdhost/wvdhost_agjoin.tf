resource "azurerm_role_assignment" "wvdhost_agjoin" {
  scope                = var.agjoin.id
  principal_id         = data.azuread_user.owner.id
  role_definition_name = "Desktop Virtualization User"
}

data "azuread_user" "owner" {
  user_principal_name = var.owner
}
