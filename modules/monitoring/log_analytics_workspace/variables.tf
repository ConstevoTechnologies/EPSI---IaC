variable "name" {
  description = "The name of log analytics workspace"
}

variable "location" {
  description = "The location"
}

variable "resource_group_name" {
  description = "The resource group for the infrastructure"
}

variable "sku" {
  description = "The used sku"
}

variable "daily_quota_gb" {
  description = "Number of GB to ingest"
}

variable "retention_in_days" {
    description = "the number of days for retention"
}

variable "internet_ingestion_enabled" {
  description = "enable/disable internet ingestion"
}

variable "internet_query_enabled" {
  description = "enable/disable internet query"
}

variable "tags" {
  type = map(string)
  description = "The infrastructure tags"
}