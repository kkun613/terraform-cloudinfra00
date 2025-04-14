resource "azurerm_network_interface" "ysjang_bat_nic" {
  name                = "ysjang-bat-nic"
  location            = azurerm_resource_group.ysjang_rg.location
  resource_group_name = azurerm_resource_group.ysjang_rg.name

  ip_configuration {
    name                          = "ysjang-bat-ipconfig"
    subnet_id                     = azurerm_subnet.ysjang_bat.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ysjang_bat_ip.id
  }
}

resource "azurerm_network_interface" "ysjang_web1_nic" {
  name                = "ysjang-web1-nic"
  location            = azurerm_resource_group.ysjang_rg.location
  resource_group_name = azurerm_resource_group.ysjang_rg.name

  ip_configuration {
    name                          = "ysjang-web1-ipconfig"
    subnet_id                     = azurerm_subnet.ysjang_web1.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_network_interface" "ysjang_web2_nic" {
  name                = "ysjang-web2-nic"
  location            = azurerm_resource_group.ysjang_rg.location
  resource_group_name = azurerm_resource_group.ysjang_rg.name

  ip_configuration {
    name                          = "ysjang-web2-ipconfig"
    subnet_id                     = azurerm_subnet.ysjang_web2.id
    private_ip_address_allocation = "Dynamic"
  }
}