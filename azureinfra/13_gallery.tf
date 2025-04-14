resource "azurerm_image" "ysjang_web1_image" {
  name                = "ysjang-web1-image"
  location            = azurerm_resource_group.ysjang_rg.location
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  hyper_v_generation  = "V2"
  source_virtual_machine_id = azurerm_linux_virtual_machine.ysjang_web1.id
  os_disk {
    size_gb      = 10
    os_type      = "Linux"
    os_state     = "Specialized"
    caching      = "ReadWrite"
    storage_type = "StandardSSD_LRS"
  }
  depends_on = [ null_resource.Generalize_web1_delay2 ]
}

resource "azurerm_shared_image_gallery" "ysjang_gallery" {
  name                = "ysjanggallery"
  location            = azurerm_resource_group.ysjang_rg.location
  resource_group_name = azurerm_resource_group.ysjang_rg.name
}

resource "azurerm_shared_image" "ysjang_rocky" {
  name                         = "ysjang-rocky"
  gallery_name                 = azurerm_shared_image_gallery.ysjang_gallery.name
  resource_group_name          = azurerm_resource_group.ysjang_rg.name
  location                     = azurerm_resource_group.ysjang_rg.location
  os_type                      = "Linux"
  hyper_v_generation           = "V2"
  architecture                 = "x64"
  min_recommended_vcpu_count   = 1
  max_recommended_vcpu_count   = 1
  min_recommended_memory_in_gb = 1
  max_recommended_memory_in_gb = 2
  identifier {
    publisher = "resf"
    offer     = "rockylinux-x86_64"
    sku       = "9-lvm"
  }

}

data "azurerm_image" "cont" {
  name = "ysjang-web1-image"
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  depends_on = [ azurerm_image.ysjang_web1_image ]
  
}

resource "azurerm_shared_image_version" "ysjang-image-version" {
  name                = "1.0.0"
  gallery_name        = azurerm_shared_image_gallery.ysjang_gallery.name
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  location            = azurerm_resource_group.ysjang_rg.location
  image_name          = azurerm_shared_image.ysjang_rocky.name
  managed_image_id    = data.azurerm_image.cont.id
  target_region {
    name                   = "koreacentral"
    regional_replica_count = 1
    storage_account_type   = "Standard_LRS"
  }
  depends_on = [azurerm_image.ysjang_web1_image]
}
