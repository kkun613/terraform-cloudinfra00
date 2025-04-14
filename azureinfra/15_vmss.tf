resource "azurerm_linux_virtual_machine_scale_set" "ysjang_vmss" {
  name                = "ysjang-vmss"
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  location            = azurerm_resource_group.ysjang_rg.location
  instances           = 1
  source_image_id     = azurerm_shared_image_version.ysjang-image-version.id
  admin_username      = "ysjang"
  sku                 = "Standard_F1s"
  upgrade_mode        = "Manual"
  priority            = "Regular"

  plan {
    publisher = "resf"
    product   = "rockylinux-x86_64"
    name      = "9-lvm"
  }


  admin_ssh_key {
    username   = "ysjang"
    public_key = file("ysjang.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  network_interface {
    name                      = "ysjang-vmss-nic"
    primary                   = true
    network_security_group_id = azurerm_network_security_group.ysjang_web_nsg.id
    ip_configuration {
      name                                         = "ysjang-vmss-ipconfig"
      subnet_id                                    = azurerm_subnet.ysjang_web1.id
      application_gateway_backend_address_pool_ids = [for pool in azurerm_application_gateway.ysjang_appgw.backend_address_pool : pool.id]
    }
  }

  boot_diagnostics {
    storage_account_uri = null
  }

}
