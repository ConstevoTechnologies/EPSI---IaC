resource "azurerm_subnet" "this" {
  # count = length(var.subnet_names)

  # name                 = var.subnet_names[count.index]
  name = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  # address_prefixes     = [var.subnet_prefixes[count.index]]
  address_prefixes     = var.address_prefixes
}