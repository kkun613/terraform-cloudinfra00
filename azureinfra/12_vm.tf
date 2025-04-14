resource "azurerm_linux_virtual_machine" "ysjang_bat" {
  name                  = "ysjang-bat"
  location              = azurerm_resource_group.ysjang_rg.location
  resource_group_name   = azurerm_resource_group.ysjang_rg.name
  size                  = "Standard_F1s"
  admin_username        = "ysjang"
  network_interface_ids = [azurerm_network_interface.ysjang_bat_nic.id]
  admin_ssh_key {
    username   = "ysjang"
    public_key = file("ysjang.pub")
  }

  user_data = base64encode(file("key.sh"))

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "9-lvm"
    version   = "9.3.20231113"
  }
  plan {
    publisher = "resf"
    product   = "rockylinux-x86_64"
    name      = "9-lvm"
  }
  boot_diagnostics {
    storage_account_uri = null
  }

}
resource "azurerm_linux_virtual_machine" "ysjang_web1" {
  name                  = "ysjang-web1"
  location              = azurerm_resource_group.ysjang_rg.location
  resource_group_name   = azurerm_resource_group.ysjang_rg.name
  size                  = "Standard_F1s"
  admin_username        = "ysjang"
  network_interface_ids = [azurerm_network_interface.ysjang_web1_nic.id]
  admin_ssh_key {
    username   = "ysjang"
    public_key = file("ysjang.pub")
  }

  user_data = base64encode(file("ins1.sh"))

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "9-lvm"
    version   = "9.3.20231113"
  }
  plan {
    publisher = "resf"
    product   = "rockylinux-x86_64"
    name      = "9-lvm"
  }

  boot_diagnostics {
    storage_account_uri = null
  }
  depends_on = [ azurerm_subnet_nat_gateway_association.ysjang_sub_nat_assoc1 ]

}
resource "azurerm_linux_virtual_machine" "ysjang_web2" {
  name                  = "ysjang-web2"
  location              = azurerm_resource_group.ysjang_rg.location
  resource_group_name   = azurerm_resource_group.ysjang_rg.name
  size                  = "Standard_F1s"
  admin_username        = "ysjang"
  network_interface_ids = [azurerm_network_interface.ysjang_web2_nic.id]
  admin_ssh_key {
    username   = "ysjang"
    public_key = file("ysjang.pub")
  }

  user_data = base64encode(file("ins2.sh"))

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "9-lvm"
    version   = "9.3.20231113"
  }
  plan {
    publisher = "resf"
    product   = "rockylinux-x86_64"
    name      = "9-lvm"
  }
  boot_diagnostics {
    storage_account_uri = null
  }
}