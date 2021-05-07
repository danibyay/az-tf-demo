data "azurerm_resource_group" "daniela-rg" {
    name = "daniela-becerra"
}

data "azurerm_resource_group" "subnet-rg" {
    name = "jorge-gongora"
}

data "azurerm_subnet" "subnet-jg" {
    name = "subnet-jg"
    virtual_network_name = "vnet-jg"
    resource_group_name = data.azurerm_resource_group.subnet-rg.name
}

/* data "azurerm_image" "my-demo-image" {
    name = 
    resource_group_name = data.azurerm_resource_group.daniela-rg.name
}*/