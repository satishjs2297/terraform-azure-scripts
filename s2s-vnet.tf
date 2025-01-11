provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "s2s_rg" {
  name     = "s2s-rg"
  location = var.location
}

resource "azurerm_virtual_network" "ibr_cp_s2s_vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = azurerm_resource_group.s2s_rg.name
  address_space       = ["172.16.0.0/16"]

  subnet {
    name           = "database-snet"
    address_prefix = "172.16.0.0/24"

    private_endpoint_network_policies_enabled = false
    private_link_service_network_policies_enabled = true
  }

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "172.16.1.0/24"

    private_endpoint_network_policies_enabled = false
    private_link_service_network_policies_enabled = true
  }
}
