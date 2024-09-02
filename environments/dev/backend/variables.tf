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

# Storage Account section

variable "sa_name" {
  description = "SA name"
  type = string
  default = "epsidevstoragefc"
}

variable "sa_account_tier" {
  description = "SA tier"
  type = string
  default = "Standard"
}

variable "sa_account_replication_type" {
  description = "SA replication type"
  type = string
  default = "ZRS"
}

variable "sa_account_kind" {
  description = "SA kind"
  type = string
  default = "StorageV2"
}

variable "sa_enable_https_traffic_only" {
  description = "SA Https traffic"
  type = bool
  default = true
}

variable "sa_min_tls_version" {
  description = "SA min TLS version"
  type = string
  default = "TLS1_2"
}

variable "sa_public_network_access_enabled" {
  description = "SA public network enabled"
  type = bool
  default = true
}

variable "sa_share_retention_policy_days" {
  description = "Number of days the share should be retained after deletion"
  type = number
  default = 30
}

variable "sa_file_shares" {
  description = "File shares"
  type = list(string)
  default = [ ]
}

variable "sa_quota" {
  description = "SA quota"
  type = number
  default = 1
}

variable "sa_containers" {
  description = "Containers"
  type = list(string)
  default = [ "tfstates"]
}

variable "sa_container_access_type" {
  description = "Container access type"
  type = string
  default = "container"
}

variable "sa_blob_versioning_enabled" {
  description = "Enable/disable blob versioning"
  type = bool
  default = true
}

variable "sa_container_delete_retention_policy_days" {
  description = "Number of days the container should be retained after deletion"
  type = number
  default = 30
}

variable "sa_blob_delete_retention_policy_days" {
  description = "Number of days the blob should be retained after deletion"
  type = number
  default = 30
}

variable "sa_default_action" {
  description = "SA default action"
  type = string
  default = "Allow"
}

variable "sa_white_list_ip_addresses" {
  description = "SA white list ip addresses"
  type = list(string)
  default = [ ]
}