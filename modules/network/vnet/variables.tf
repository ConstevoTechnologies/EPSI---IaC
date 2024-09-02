variable "name" {
  description = "The virtual network name"
}

variable "address_space" {
  description = "The virtual netwotk address space"
}

variable "location" {
  description = "The location for the AKS cluster"
  default     = "eastus2"
}

variable "resource_group_name" {
  description = "The resource group name"
}

variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}