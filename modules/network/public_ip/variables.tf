variable "name" {
  description = "The public ip name"
}

variable "location" {
  description = "The location"
}

variable "resource_group_name" {
  description = "The resource group name"
}

variable "allocation_method" {
  description = "The public ip allocation method"
}

variable "sku" {
  description = "The public ip sku"
}

variable "zones" {
  description = "The public ip zones"
}

variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}