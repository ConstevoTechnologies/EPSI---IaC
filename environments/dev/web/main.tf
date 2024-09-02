# Resource group section

module "resource_group" {
  source = "../../modules/network/resource_group"

  name = "${var.application}-${var.environment}-rg-${var.location}"
  location            = var.location
  lock_level = var.lock_level
  notes = var.notes

  tags = var.tags
}

# virtual network section

module "vnet" {
  source = "../../modules/network/vnet"

  name = "${var.application}-${var.environment}-vnet-${var.location}"
  address_space       = var.address_space
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  tags = var.tags

  depends_on = [
    module.resource_group
  ]
}

# Subnet section

module "subnets" {
  source = "../../modules/network/subnet"

  for_each              = var.subnets
  name = each.value["name"]
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.vnet.name
  address_prefixes = each.value["address_prefixes"]

  depends_on = [
    module.vnet
  ]
}

# Public IP section

module "public_ip" {
  source = "../../modules/network/public_ip"

  name = var.public_ip_name
  resource_group_name = module.resource_group.name
  location = var.location
  allocation_method = var.allocation_method
  sku = var.public_ip_sku
  zones = var.zones

  tags = var.tags
}

# module "public_ip_vm" {
#   source = "../../../modules/network/public_ip"

#   name = var.public_ip_name_vm
#   resource_group_name = module.resource_group.name
#   location = var.location
#   allocation_method = var.allocation_method
#   sku = var.public_ip_sku
#   zones = var.zones

#   tags = var.tags
# }

# VM section

module "vm" {
  source = "../../modules/compute/vm"

  vm_name = var.vm_name
  resource_group_name = module.resource_group.name
  location = var.location
  size = var.size
  admin_username = var.admin_username
  vm_public_key = tls_private_key.this.public_key_openssh
  
  user_data = base64encode(templatefile("./files/install_dependencies.tftpl", {
    AgentPoolName    = var.agent_pool_name
    AgentName = var.agent_name
    Token = var.token
  }))

  caching = var.caching
  storage_account_type = var.storage_account_type

  publisher = var.publisher
  offer = var.offer
  sku = var.sku
  image_version = var.image_version

  nic_name = "${var.application}-${var.environment}-nic-${var.location}"

  ip_configuration_name = var.ip_configuration_name
  subnet_id = module.subnets["DevOpsSubnet"].subnet_id
  private_ip_address_allocation = var.private_ip_address_allocation
  public_ip_address = module.public_ip_vm.id

  tags = var.tags

  depends_on = [
    module.subnets,
    module.public_ip_vm
  ]
}

# Key vault section
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits = 4096
}

data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "../../modules/vault/key_vault"

  name = var.kv_name
  location = module.resource_group.location
  resource_group_name = module.resource_group.name
  sku_name = var.kv_sku_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  public_network_access_enabled = var.kv_public_network_access_enabled
  white_list_ip_addresses = var.kv_white_list_ip_addresses
  key_permissions               = var.kv_key_permissions
  secret_permissions            = var.kv_secret_permissions
  certificate_permissions       = var.kv_certificate_permissions
  storage_permissions           = var.kv_storage_permissions
  secrets = {
    "emav5devops-agent":{
      name = "emav5devops-preview-ssh-key-eastus2"
      value = tls_private_key.this.private_key_pem
    }
  }

  tags = var.tags

  depends_on = [
    module.resource_group
  ]
}