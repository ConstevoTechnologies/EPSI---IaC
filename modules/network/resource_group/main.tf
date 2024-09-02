resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location

  tags = var.tags
}

resource "azurerm_management_lock" "resource_group_lock" {
  name       = var.name
  scope      = azurerm_resource_group.this.id
  lock_level = var.lock_level
  notes      = var.notes
}