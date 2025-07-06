# SQL Database creation
resource "azurerm_mssql_database" "sqldatabase" {
    for_each = var.sqldatabasevariable
  name         = each.value.name
  server_id    = data.azurerm_mssql_server.SQLServer.id
}

