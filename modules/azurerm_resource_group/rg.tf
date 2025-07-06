# RG Creation
resource "azurerm_resource_group" "rg" {
  for_each = var.rgvariable
  name     = each.value.name
  location = each.value.location
}


