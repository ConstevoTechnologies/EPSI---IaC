resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  account_kind = var.account_kind
  https_traffic_only_enabled = var.https_traffic_only_enabled
  min_tls_version = var.min_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  share_properties {
    retention_policy {
      days = var.share_retention_policy_days
    }
  }

  blob_properties {
    versioning_enabled = var.blob_versioning_enabled
    container_delete_retention_policy {
      days = var.container_delete_retention_policy_days
    }
    delete_retention_policy {
      days = var.blob_delete_retention_policy_days
    }
  }

  tags = var.tags
}

resource "azurerm_storage_share" "this" {
  for_each = toset( var.file_shares )
  name                 = each.value
  storage_account_name = azurerm_storage_account.this.name
  quota = var.quota
}

resource "azurerm_storage_container" "this" {
  for_each = toset( var.containers )
  name                 = each.value
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_account_network_rules" "this" {
  storage_account_id = azurerm_storage_account.this.id

  default_action = var.default_action
  ip_rules       = var.white_list_ip_addresses
  bypass         = ["Metrics", "Logging", "AzureServices"]
}