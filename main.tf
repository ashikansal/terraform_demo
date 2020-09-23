resource "azurerm_resource_group" "test-rg" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_key_vault_access_policy" "kv_access_policy" {
  key_vault_id = data.azurerm_key_vault.test_kv.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  secret_permissions = [
    "get",
  ]
}

module "virtual_machine" {
  source = "./modules/virtual_machine"
  resource_group_name = azurerm_resource_group.test-rg.name
  prefix = var.prefix
  vnet_address_space = var.vnet_address_space
  subnet_address_prefixes = var.subnet_address_prefixes
  vm_size = var.vm_size
  vm_password = data.azurerm_key_vault_secret.test_kv_secret.value
}

