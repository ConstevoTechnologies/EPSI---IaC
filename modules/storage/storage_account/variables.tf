variable "name" {
  description = "The name for the Storage Account"
}

variable "location" {
  description = "The location for the AKS cluster"
  default     = "eastus2"
}

variable "resource_group_name" {
  description = "The resource group for the Storage Account"
}

variable "account_replication_type" {
  description = "The storage account replication type"
  default     = "LRS"
}

variable "account_tier" {
  description = "The storage account tier"
  default     = "Standard"
}

variable "account_kind" {
  description = "The storage account kind"
}

variable "https_traffic_only_enabled" {
  description = "Enable/Disable https traffic only"
}

variable "min_tls_version" {
  description = "Minimum TLS version"
}

variable "public_network_access_enabled" {
  description = "enable/disable public access"
}

variable "share_retention_policy_days" {
  description = "Number of days the share should be retained after deletion"
}

variable "file_shares" {
  description = "List of file shares to be created"
  type = list(string)
}

variable "quota" {
  description = "The maximum size of the share, in gigabytes"
}

variable "containers" {
  description = "List of containers"
}

variable "container_access_type" {
  description = "The container access type"
}

variable "blob_versioning_enabled" {
  description = "Enable/disable blob versioning"
}

variable "container_delete_retention_policy_days" {
  description = "Number of days the container should be retained after deletion"
}

variable "blob_delete_retention_policy_days" {
  description = "Number of days the blob should be retained after deletion"
}

variable "default_action" {
  description = "allow/deny"
}

variable "white_list_ip_addresses" {
  description = "white lis of ip addresses"
}

variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}