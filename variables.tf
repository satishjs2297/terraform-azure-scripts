variable "location" {
  type        = string
  description = "The location for the resources."
  default     = "centralus"
}

variable "name" {
  type        = string
  description = "The name of the virtual network gateway."
  default     = "ibr-cp-s2s-vpn-gwy"
}

variable "gatewayType" {
  type        = string
  description = "The type of gateway."
  default     = "Vpn"
}

variable "sku" {
  type        = string
  description = "The SKU of the VPN gateway."
  default     = "VpnGw1"
}

variable "vpnType" {
  type        = string
  description = "The type of VPN."
  default     = "RouteBased"
}

variable "vpnGatewayGeneration" {
  type        = string
  description = "The generation of the VPN gateway."
  default     = "Generation1"
}

variable "subnetId" {
  type        = string
  description = "The ID of the subnet."
  default     = "/subscriptions/ed9359f3-d606-48d7-b5fe-fd361dcc1a9c/resourceGroups/s2s-rg/providers/Microsoft.Network/virtualNetworks/ibr-cp-s2s-vnet/subnets/GatewaySubnet"
}

variable "newPublicIpAddressName" {
  type        = string
  description = "The name of the new public IP address."
  default     = "vpngwy-pip"
}

variable "virtual_network_name" { 
  type = string description = "The name of the virtual network." 
  default = "ibr-cp-s2s-vnet" # Update this if needed 
}
