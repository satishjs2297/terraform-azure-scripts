provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "s2s-rg" {
  name     = "s2s-rg"
  location = var.location
}

resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = var.name
  location            = var.location
  resource_group_name = azurerm_resource_group.s2s-rg.name

  type     = var.gatewayType
  vpn_type = var.vpnType

  sku {
    name = var.sku
  }

  ip_configuration {
    name                          = "default"
    public_ip_address_id          = azurerm_public_ip.vpngwy_pip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.subnetId
  }

  vpn_gateway_generation = var.vpnGatewayGeneration
}

resource "azurerm_public_ip" "vpngwy_pip" {
  name                = var.newPublicIpAddressName
  location            = var.location
  resource_group_name = azurerm_resource_group.s2s-rg.name

  allocation_method = "Static"

  sku {
    name = "Standard"
  }
}
