locals {
  storage_account_name = replace("${var.prefix}0sa","-","0")
}
resource "azurerm_storage_account" "test_sa" {
  name = local.storage_account_name
  resource_group_name = azurerm_resource_group.test-rg.name
  location = var.location
  account_tier = var.is_hns_enabled ? "Standard" : var.account_tier
  account_replication_type = var.account_replication_type
  is_hns_enabled = var.is_hns_enabled
}

resource "azurerm_role_assignment" "contributor" {
  scope = azurerm_storage_account.test_sa.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id = module.virtual_machine.vm_identity
}