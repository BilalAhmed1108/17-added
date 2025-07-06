# Keyvault Data Block
data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.rg_name
}

# Secret Data Block username
data "azurerm_key_vault_secret" "username" {
  name         = var.secret_username
  key_vault_id = data.azurerm_key_vault.kv.id
}

# Secret Data Block password
data "azurerm_key_vault_secret" "password" {
  name         = var.secret_password
  key_vault_id = data.azurerm_key_vault.kv.id
}

# NIC Data block
data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.rg_name
}