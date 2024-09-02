resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name = var.sku_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  network_acls {
    default_action = "Deny"
    ip_rules       = var.white_list_ip_addresses
    bypass         = "AzureServices"
  }
  
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = var.key_permissions
    secret_permissions = var.secret_permissions
    certificate_permissions = var.certificate_permissions
    storage_permissions = var.storage_permissions
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "this" {
  for_each = var.secrets
  name         = each.value.name
  value        = each.value.value
  key_vault_id = azurerm_key_vault.this.id

  tags = var.tags
}