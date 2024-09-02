# Shared section

variable "location" {
  description = "Azure region"
  type = string
  default = "francecentral"
}

variable "environment" {
  description = "The environment"
  type = string
  default = "dev"
}

variable "application" {
  description = "EPSI IaC"
  type = string
  default = "epsibackend"
}

variable "tags" {
  description = "List of used tags"
  type = map(string)
  default = {
    "Environment" = "dev"
    "Application Name" = "EPSI Module IaC"
    "System" = "EPSI Terraform states"
    "Created By" = "DevOps/Cloud team"
    "Contact" = "mahdi.ghandri@constevo.tech"
  }
}

# Resource group section

variable "lock_level" {
  description = "Lock level"
  type = string
  default = "CanNotDelete"
}

variable "notes" {
  description = "Note about the lock"
  type = string
  default = "Items can't be deleted in this resource group"
}

# Vnet section

variable "address_space" {
  description = "The address space that is used by the virtual network."
  type        = list(string)
  default     = ["10.24.0.0/16"]
}

# Subnets section

variable "subnets" {
  description = "Map of Azure VNET subnet configuration"
  type        = map(any)
  default = {
    AzureBastionSubnet = {
      name                 = "AzureBastionSubnet"
      address_prefixes     = ["10.24.0.0/24"]
    },
    DevOpsSubnet = {
      name                 = "DevOpsSubnet"
      address_prefixes     = ["10.24.1.0/24"]
    },
  }
}

# Public IP section

variable "public_ip_name" {
  description = "The public ip name"
  type = string
  default = "bastion_public_ip"
}

variable "allocation_method" {
  description = "The public ip allocation method"
  type = string
  default = "Static"
}

variable "public_ip_sku" {
  description = "The public ip sku"
  type = string
  default = "Standard"
}

variable "zones" {
  description = "The public ip zones"
  type = list(string)
  default = ["1", "2", "3"]
}

variable "public_ip_name_vm" {
  description = "The VM public ip name"
  type = string
  default = "vm_public_ip"
}

# Bastion host section

variable "bastion_host_name" {
  description = "The Bastion host name"
  type = string
  default = "ema-v5-agent-vnet-bastion"
}

variable "bastion_ip_configuration_name" {
  description = "The name of the Bastion IP configuration"
  type = string
  default = "bastion_ip_configuration"
}

# VM section

variable "vm_name" {
  description = "The name of the VM"
  type = string
  default = "azure-devops-preview-v5-agent"
}

variable "size" {
  description = "The size of the VM"
  type = string
  default = "Standard_F2"
}

variable "admin_username" {
  description = "The admin username"
  type = string
  default = "adminuser"
}

variable "user_data" {
  description = "The script to execute"
  type = string
  default = ""
}

variable "caching" {
  description = "The caching method"
  type = string
  default = "ReadWrite"
}

variable "storage_account_type" {
  description = "The storage account type"
  type = string
  default = "Standard_LRS"
}

variable "publisher" {
  description = "The publisher of the image"
  type = string
  default = "Canonical"
}

variable "offer" {
  description = "The offer type"
  type = string
  default = "UbuntuServer"
}

variable "sku" {
  description = "The version number to use"
  type = string
  default = "18.04-LTS"
}

variable "image_version" {
  description = "The image version to use"
  type = string
  default = "latest"
}

# Network Interface section

variable "nic_name" {
  description = "The name of the NIC"
  type = string
  default = "azure-devops-v5-agent-nic"
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type = string
  default = "AgentIPConfig"
}

variable "private_ip_address_allocation" {
  description = "The allocation method used for the private IP adress"
  type = string
  default = "Dynamic"
}

# Key vault section

variable "kv_name" {
  description = "KV name"
  type = string
  default = "emav5devopsprevkveastus2"
}

variable "kv_sku_name" {
  description = "KV sku name"
  type = string
  default = "standard"
}

variable "kv_public_network_access_enabled" {
  description = "KV public network enabled"
  type = bool
  default = true
}

variable "kv_white_list_ip_addresses" {
  description = "KV white list ip addresses"
  type = list(string)
  default = [ "0.0.0.0/0" ]
}

variable "kv_key_permissions" {
  description = "KV key permissions"
  type = list(string)
  default = [ "Create", "Get", "List" ]
}

variable "kv_secret_permissions" {
  description = "KV secret permissions"
  type = list(string)
  default = [ "Set", "Get", "List", "Recover", "Restore", "Purge", "Delete" ]
}

variable "kv_certificate_permissions" {
  description = "KV certificate permissions"
  type = list(string)
  default = [ "Create", "Get", "Import", "List", "Recover", "Restore", "Purge", "Delete" ]
}

variable "kv_storage_permissions" {
  description = "KV storage permissions"
  type = list(string)
  default = [ "Set", "Backup", "Get", "List", "Recover", "Recover", "Restore", "Purge", "Delete" ]
}

# VM Agent Informations

variable "agent_pool_name" {
  description = "Agent Pool Name"
  type = string
}

variable "agent_name" {
  description = "Agent Name"
  type = string
}

variable "token" {
  description = "Token"
  type = string
}