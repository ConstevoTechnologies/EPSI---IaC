variable "name" {
  description = "The NSG name"
}

variable "location" {
  description = "The NSG location"
}

variable "resource_group_name" {
  description = "The resource group name"
}

variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}