data "azurerm_key_vault" "test_kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

data "azurerm_key_vault_secret" "test_kv_secret" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.test_kv.id
  depends_on = [azurerm_key_vault_access_policy.kv_access_policy]
}

data "azurerm_client_config" "current" {}