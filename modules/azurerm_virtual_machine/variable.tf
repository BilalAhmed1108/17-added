# Virtual Machine Variable
variable "vmvariable" {
  type = map(any)
}

# Resource Group Variables
variable "rg_name" {}
variable "rg_location" {}

# Keyvault Data Block Variable
variable "kv_name" {}

# Secret Data Block Variable
variable "secret_username" {}
variable "secret_password" {}

# Nic Data Block password
variable "nic_name" {}



