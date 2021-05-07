terraform {
  backend "azurerm" {
    resource_group_name  = "daniela-becerra"
    storage_account_name = "viernesdemodoubackend"
    container_name       = "state"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = "~> 2.0"
  }
}