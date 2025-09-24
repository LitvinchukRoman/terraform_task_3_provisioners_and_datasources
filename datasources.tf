data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "main" {
  name                = "my-vnet"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "internal" {
  name                 = "internal"
  virtual_network_name = data.azurerm_virtual_network.main.name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_interface" "main" {
  name                = "my-nic"
  resource_group_name = var.resource_group_name
}