# RG Module
module "rg" {
  source     = "../../modules/azurerm_resource_group"
  rgvariable = var.rgvariable_dev
}

## Storage Module
module "stg" {
  depends_on  = [module.rg]
  source      = "../../modules/azurerm_storage_account"
  stgvariable = var.stgvariable_dev
}

# Virtual Network Module
module "vnet" {
  depends_on   = [module.rg]
  source       = "../../modules/azurerm_virtual_network"
  vnetvariable = var.vnetvariable_dev
}

# Frontend Subnet Module
module "frontendsubnet" {
  depends_on     = [module.vnet]
  source         = "../../modules/azurerm_subnet"
  subnetvariable = var.frontend_subnetvariable_dev
}

# Backend Subnet Module
module "backendsubnet" {
  depends_on     = [module.vnet]
  source         = "../../modules/azurerm_subnet"
  subnetvariable = var.backend_subnetvariable_dev
}

# Frontend Public IP Module
module "frontendpip" {
  depends_on  = [module.rg]
  source      = "../../modules/azurerm_public_ip"
  pipvariable = var.frontendpipvariable_dev
}

# Backend Public IP Module
module "backendpip" {
  depends_on  = [module.rg]
  source      = "../../modules/azurerm_public_ip"
  pipvariable = var.backendpipvariable_dev
}

# Frontend NIC Module
module "frontendnic" {
  depends_on    = [module.frontendpip, module.frontendsubnet]
  source        = "../../modules/azurerm_network_interface_card"
  nicvariable   = var.frontend_nicvariable_dev
  subnet_name   = var.frontendsubnet_name_dev
  vnet_name     = var.vnet_name_dev
  rg_name       = var.rg_name_dev
  data_pip_name = var.data_frontend_pip_name_dev
}

# Backend NIC Module
module "backendnic" {
  depends_on    = [module.backendpip, module.backendsubnet]
  source        = "../../modules/azurerm_network_interface_card"
  nicvariable   = var.backend_nicvariable_dev
  subnet_name   = var.backendsubnet_name_dev
  vnet_name     = var.vnet_name_dev
  rg_name       = var.rg_name_dev
  data_pip_name = var.data_backend_pip_name_dev
}

# Keyvault Module
module "kv" {
  depends_on       = [module.rg]
  source           = "../../modules/azurerm_keyvault"
  keyvaultvariable = var.keyvaultvariable_dev

}

# Keyvault Secret Username Module
module "kv_secret_username" {
  depends_on = [module.kv]
  source     = "../../modules/azurerm_keyvault_secret"
  kv_secret  = var.kv_secret_usernamevariable
  kv_name    = var.kv_name_dev
  rg_name    = var.rg_name_dev
}

# Keyvault Secret Password Module
module "kv_secret_password" {
  depends_on = [module.kv]
  source     = "../../modules/azurerm_keyvault_secret"
  kv_secret  = var.kv_secret_passwordvariable
  kv_name    = var.kv_name_dev
  rg_name    = var.rg_name_dev
}

# SQL Server Module
module "sqlserver" {
  depends_on          = [module.kv_secret_username, module.kv_secret_password]
  source              = "../../modules/azurerm_sql_server"
  sqlservervariable   = var.sqlservervariable_dev
  kv_name             = var.kv_name_dev
  rg_name             = var.rg_name_dev
  secret_usernamename = var.secret_username_dev
  secret_password     = var.secret_password_dev
}

# SQL Database Module
module "sqldatabase" {
  depends_on          = [module.sqlserver]
  source              = "../../modules/azurerm_sql_database"
  sqldatabasevariable = var.sqldatabasevariable_dev
  sqlservername       = var.sqlservername_dev
  rg_name             = var.rg_name_dev
}

# Frontend Virtual Machine Module
module "frontvm" {
  source          = "../../modules/azurerm_virtual_machine"
  depends_on      = [module.frontendnic, module.frontendsubnet, module.kv_secret_username, module.kv_secret_password]
  vmvariable      = var.frontend_vmvariable_dev
  rg_name         = var.rg_name_dev
  rg_location     = var.rg_location_dev
  kv_name         = var.kv_name_dev
  secret_username = var.secret_username_dev
  secret_password = var.secret_password_dev
  nic_name        = var.frontend_nic_name_dev
}

# Backend Virtual Machine Module
module "backvm" {
  source          = "../../modules/azurerm_virtual_machine"
  depends_on      = [module.backendnic, module.backendsubnet, module.kv_secret_username, module.kv_secret_password]
  vmvariable      = var.backend_vmvariable_dev
  rg_name         = var.rg_name_dev
  rg_location     = var.rg_location_dev
  kv_name         = var.kv_name_dev
  secret_username = var.secret_username_dev
  secret_password = var.secret_password_dev
  nic_name        = var.backend_nic_name_dev
}