variable "dns_zone_name" {
  description = "private DNS Zone name"
}

variable "dns_zone_vnet_link_name" {
  description = "DNS Zone vnet link name"
}

variable "pe_name" {
  description = "Private Endpoint name"
}

variable "location" {
  description = "The location for the AKS cluster"
  default     = "eastus2"
}

variable "resource_group_name" {
  description = "The resource group name"
}

variable "virtual_network_id" {
  description = "The virtual network id"
}

variable "subnet_id" {
  description = "The subnet network id"
}

variable "private_connection_resource_id" {
  description = "The private connection resource id"
}

variable "subresource_names" {
  description = "The used subresource names"
}

variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}