provider "azurerm" {
  version = "=1.39.0"
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "myTFVnet"
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
}
