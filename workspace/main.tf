terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform"
    storage_account_name = "l0wdevterraform"
    container_name       = "workspace"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "1b056bbb-8e78-4ad1-8fd2-aa73d237239a"
  features {}
}

provider "azuread" {
  tenant_id = "bcd388dd-3247-4137-9a8d-a55a4b2de147"
}
