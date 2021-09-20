data "azurerm_resource_group" "daniela-rg" {
    name = "daniela-becerra"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "virtualNetwork1"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.daniela-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "example-subnet"
  resource_group_name  = data.azurerm_resource_group.daniela-rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

/* data "azurerm_image" "my-demo-image" {
    name = 
    resource_group_name = data.azurerm_resource_group.daniela-rg.name
}*/