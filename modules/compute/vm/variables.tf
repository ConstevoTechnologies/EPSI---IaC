# Shared section

variable "location" {
  description = "Azure region"
}

variable "tags" {
  description = "List of used tags"
}

# Resource group section

variable "resource_group_name" {
  description = "The resource group name"
}

# VM section

variable "vm_name" {
  description = "The name of the VM"
}

variable "size" {
  description = "The size of the VM"
}

variable "admin_username" {
  description = "The admin username"
}

variable "vm_public_key" {
  description = "The VM SSH public key"
}

variable "user_data" {
  description = "The script to execute"
}

variable "public_ip_address" {
  description = "The VM public IP"
}

variable "caching" {
  description = "The caching method"
}

variable "storage_account_type" {
  description = "The storage account type"
}

variable "publisher" {
  description = "The publisher of the image"
}

variable "offer" {
  description = "The offer type"
}

variable "sku" {
  description = "The version number to use"
}

variable "image_version" {
  description = "The image version to use"
}

# Network Interface section

variable "nic_name" {
  description = "The name of the NIC"
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
}

variable "subnet_id" {
  description = "The id of the subnet"
}

variable "private_ip_address_allocation" {
  description = "The allocation method used for the private IP adress"
}