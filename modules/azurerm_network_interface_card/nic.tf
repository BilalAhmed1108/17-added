# NIC Creation
resource "azurerm_network_interface" "nic" {
    for_each = var.nicvariable
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}

