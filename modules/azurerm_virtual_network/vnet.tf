# Virtual Network Creation
resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnetvariable
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space                                             #["10.0.0.0/16"]
}

