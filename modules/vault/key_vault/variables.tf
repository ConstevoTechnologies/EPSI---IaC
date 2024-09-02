variable "name" {
  description = "The name for the AKS cluster"
}

variable "location" {
  description = "The location"
}

variable "resource_group_name" {
  description = "The resource group name"
}

variable "sku_name" {
  description = "The sku name"
}

variable "tenant_id" {
  description = "The tenant id"
}

variable "object_id" {
  description = "The object id"
}

variable "public_network_access_enabled" {
  description = "Allow/Deny public access"
}

variable "white_list_ip_addresses" {
  description = "white lis of ip addresses"
}

variable "key_permissions" {
  description = "key permissions"
}

variable "secret_permissions" {
  description = "secret permissions"
}

variable "certificate_permissions" {
  description = "cetificate permissions"
}

variable "storage_permissions" {
  description = "storage permissions"
}

variable "secrets" {
  description = "Map of secrets"
}


variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}