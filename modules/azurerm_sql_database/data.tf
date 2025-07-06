# SQL Server Data block
data "azurerm_mssql_server" "SQLServer" {
  name                = var.sqlservername
  resource_group_name = var.rg_name
}