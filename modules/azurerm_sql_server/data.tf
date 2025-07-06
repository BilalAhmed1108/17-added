# KEY Vault Data BLock
data "azurerm_key_vault" "key_vault" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

# Secret Data Block username
data "azurerm_key_vault_secret" "username" {
  name         = var.secret_usernamename
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

# Secret Data Block password
data "azurerm_key_vault_secret" "password" {
  name         = var.secret_password
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

