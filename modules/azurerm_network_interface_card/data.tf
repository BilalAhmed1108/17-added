# Data Block Subnet
data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}
# Data Block PIP
data "azurerm_public_ip" "pip" {
  name                = var.data_pip_name
  resource_group_name = var.rg_name
}