# Seperate variable values
rg_name_dev                = "bilalrgincentraltus"
rg_location_dev            = "Central US"
vnet_name_dev              = "bilalkavnet"
frontendsubnet_name_dev    = "bilalfrontendsubnet"
data_frontend_pip_name_dev = "frontendkipip"
backendsubnet_name_dev     = "bilalbackendsubnet"
data_backend_pip_name_dev  = "backendkipip"
kv_name_dev                = "bgvykeyvault12345"
secret_username_dev        = "kvkvusernames"
secret_password_dev        = "kvkvpasswords"
sqlservername_dev          = "bilalsqlserver22"
frontend_nic_name_dev      = "frontendnic"
backend_nic_name_dev       = "backendnic"


# Resource Group Values
rgvariable_dev = {
  "rg_dev" = {
    name     = "bilalrgincentraltus"
    location = "Central us"
  }
 
}


# Storage Account Values
stgvariable_dev = {
  "stg_dev" = {
    name                     = "stgbgvy"
    resource_group_name      = "bilalrgincentraltus"
    location                 = "Central us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

# Virtual Network Values
vnetvariable_dev = {
  "vnet_dev" = {
    name                = "bilalkavnet"
    location            = "Central us"
    resource_group_name = "bilalrgincentraltus"
    address_space       = ["10.0.0.0/16"]
  }
}

# Frontend Subnet Values
frontend_subnetvariable_dev = {
  "frontend_subnet" = {
    name                 = "bilalfrontendsubnet"
    resource_group_name  = "bilalrgincentraltus"
    virtual_network_name = "bilalkavnet"
    address_prefixes     = ["10.0.0.0/24"]
  }
}

# Backend Subnet Values
backend_subnetvariable_dev = {
  "frontend_subnet" = {
    name                 = "bilalbackendsubnet"
    resource_group_name  = "bilalrgincentraltus"
    virtual_network_name = "bilalkavnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

# Frontendpip Values
frontendpipvariable_dev = {
  "frontendpip" = {
    name                = "frontendkipip"
    resource_group_name = "bilalrgincentraltus"
    location            = "Central us"
    allocation_method   = "Dynamic"     # Static or Dynamic, but Dynamic required for Basic SKU
    sku                 = "Basic" #"Standard"
  }
}

# Backendpip Values
backendpipvariable_dev = {
  "frontendpip" = {
    name                = "backendkipip"
    resource_group_name = "bilalrgincentraltus"
    location            = "Central us"
    allocation_method   = "Static"
    sku                 = "Standard"   # Static is always used with standard
  }
}

# Frontend NIC Values
frontend_nicvariable_dev = {
  frontendnic = {
    name                          = "frontendnic"
    location                      = "Central us"
    resource_group_name           = "bilalrgincentraltus"
    ip_name                       = "frontnicip"
    private_ip_address_allocation = "Dynamic"
  }
}

# Backend NIC Values
backend_nicvariable_dev = {
  frontendnic = {
    name                          = "backendnic"
    location                      = "Central us"
    resource_group_name           = "bilalrgincentraltus"
    ip_name                       = "backnicip"
    private_ip_address_allocation = "Dynamic"
  }
}

# Keyvault Values
keyvaultvariable_dev = {
  kv = {
    name                        = "bgvykeyvault12345"
    location                    = "Central us"
    resource_group_name         = "bilalrgincentraltus"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
    enable_rbac_authorization   = true
  }

}

# Keyvault Secret Username Value
kv_secret_usernamevariable = {
  username = {
    name  = "kvkvusernames"
    value = "used"
  }
}

# Keyvault Secret Username Values
kv_secret_passwordvariable = {
  username = {
    name  = "kvkvpasswords"
    value = "Smartuser123#"
  }
}

# SQL Server Values
sqlservervariable_dev = {
  sqlvariable = {
    name                = "bilalsqlserver22"
    resource_group_name = "bilalrgincentraltus"
    location            = "Central us"
    version             = "12.0"
    minimum_tls_version = "1.2"

  }
}

# SQL Database Values
sqldatabasevariable_dev = {
  database = {
    name = "bilalsqldatabases95"
  }
}

# Frontend Virtual machine
frontend_vmvariable_dev = {
  frontend = {
    name                            = "frontkavm"
    size                            = "Standard_F2"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}

# Backend Virtual machine
backend_vmvariable_dev = {
  backend = {
    name                            = "backkavm"
    size                            = "Standard_F2"
    disable_password_authentication = false
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}