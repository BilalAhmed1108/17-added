# Keyvault Creation
data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "kv" {
    for_each = var.keyvaultvariable
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption    #true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days                 # 7
  purge_protection_enabled    = each.value.purge_protection_enabled                      #false

  sku_name = each.value.sku_name               # "standard"
  enable_rbac_authorization = each.value.enable_rbac_authorization                     # true

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     key_permissions = [
#       "Get",
#     ]

#     secret_permissions = [
#       "Get",
#     ]

#     storage_permissions = [
#       "Get",
#     ]
#   }
}


# Role asignment to key vault
resource "azurerm_role_assignment" "kv_admin" {
  depends_on = [ azurerm_key_vault.kv]
  for_each             = var.keyvaultvariable
  scope                = azurerm_key_vault.kv[each.key].id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

