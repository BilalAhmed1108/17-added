# Seperate Variables
variable "rg_name_dev" {}
variable "rg_location_dev" {}
variable "vnet_name_dev" {}
variable "frontendsubnet_name_dev" {}
variable "data_frontend_pip_name_dev" {}
variable "backendsubnet_name_dev" {}
variable "data_backend_pip_name_dev" {}
variable "kv_name_dev" {}
variable "secret_username_dev" {}
variable "secret_password_dev" {}
variable "sqlservername_dev" {}
variable "frontend_nic_name_dev" {}
variable "backend_nic_name_dev" {}



# RG Variable
variable "rgvariable_dev" {
  type = map(any)
}


# # Storage Account Variable
variable "stgvariable_dev" {
  type = map(any)
}

# Virtual Network Variable
variable "vnetvariable_dev" {}

# Frontend Subnet Variable
variable "frontend_subnetvariable_dev" {}

# Backend Subnet Variable
variable "backend_subnetvariable_dev" {}

# Frontend PIP Variable
variable "frontendpipvariable_dev" {}

# Backend PIP Variable
variable "backendpipvariable_dev" {}

# Frontend NIC Variable
variable "frontend_nicvariable_dev" {}

# Backend NIC Variable
variable "backend_nicvariable_dev" {}

# Keyvault Variable
variable "keyvaultvariable_dev" {}

# Keyvault Username Variable
variable "kv_secret_usernamevariable" {}

# Keyvault Password Variable
variable "kv_secret_passwordvariable" {}

# SQL Server Variable
variable "sqlservervariable_dev" {}

# SQL Database variable
variable "sqldatabasevariable_dev" {}

# Frontend Virtual Machine variable
variable "frontend_vmvariable_dev" {}

# VBackend irtual Machine variable
variable "backend_vmvariable_dev" {}