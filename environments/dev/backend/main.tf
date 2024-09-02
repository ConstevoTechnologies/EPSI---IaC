# Resource group section

module "resource_group" {
  source = "../../../modules/network/resource_group"

  name = "${var.application}-${var.environment}-rg-${var.location}"
  location            = var.location
  lock_level = var.lock_level
  notes = var.notes

  tags = var.tags
}

# Storage account section

module "storage_account" {
  source = "../../../modules/storage/storage_account"
  name                = var.sa_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  account_tier             = var.sa_account_tier
  account_replication_type = var.sa_account_replication_type
  account_kind             = var.sa_account_kind
  # enable_https_traffic_only = var.sa_enable_https_traffic_only
  https_traffic_only_enabled = var.sa_enable_https_traffic_only
  min_tls_version = var.sa_min_tls_version
  public_network_access_enabled = var.sa_public_network_access_enabled
  share_retention_policy_days = var.sa_share_retention_policy_days
  file_shares = var.sa_file_shares
  quota = var.sa_quota
  containers = var.sa_containers
  container_access_type = var.sa_container_access_type
  blob_versioning_enabled = var.sa_blob_versioning_enabled
  container_delete_retention_policy_days = var.sa_container_delete_retention_policy_days
  blob_delete_retention_policy_days = var.sa_blob_delete_retention_policy_days
  default_action = var.sa_default_action
  white_list_ip_addresses = var.sa_white_list_ip_addresses

  tags = var.tags

  depends_on = [
    module.resource_group
  ]
}