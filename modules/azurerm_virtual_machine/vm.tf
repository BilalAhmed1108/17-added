# Virtual Machine Creation
resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vmvariable
  name                = each.value.name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = each.value.size  #"Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = each.value.disable_password_authentication # false
  network_interface_ids = [
    data.azurerm_network_interface.nic.id,
  ]



  os_disk {
    caching              =  each.value.caching    # "ReadWrite"
    storage_account_type = each.value.storage_account_type #"Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher #"Canonical"
    offer     = each.value.offer #"0001-com-ubuntu-server-jammy"
    sku       = each.value.sku #"22_04-lts"
    version   = each.value.version    #"latest"
  }

    # cloud-init script for NGINX installation
  custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF
  )
}