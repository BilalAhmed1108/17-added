# SQL Server Creation
resource "azurerm_mssql_server" "sqlserver" {
    for_each = var.sqlservervariable
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version             #"12.0"
  administrator_login          = data.azurerm_key_vault_secret.username.value
  administrator_login_password = data.azurerm_key_vault_secret.password.value
  minimum_tls_version          = each.value.minimum_tls_version  # 1.2
}