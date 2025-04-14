resource "azurerm_subnet" "ysjang_bat" {
  name                            = "ysjang-bat"
  resource_group_name             = azurerm_resource_group.ysjang_rg.name
  virtual_network_name            = azurerm_virtual_network.ysjang_vnet.name
  address_prefixes                = ["10.0.0.0/24"]
  default_outbound_access_enabled = true
}
resource "azurerm_subnet" "ysjang_appgw" {
  name                            = "ysjang-appgw"
  resource_group_name             = azurerm_resource_group.ysjang_rg.name
  virtual_network_name            = azurerm_virtual_network.ysjang_vnet.name
  address_prefixes                = ["10.0.1.0/24"]
  default_outbound_access_enabled = true
}

resource "azurerm_subnet" "ysjang_nat" {
  name                            = "ysjang-nat"
  resource_group_name             = azurerm_resource_group.ysjang_rg.name
  virtual_network_name            = azurerm_virtual_network.ysjang_vnet.name
  address_prefixes                = ["10.0.2.0/24"]
  default_outbound_access_enabled = true
}

resource "azurerm_subnet" "ysjang_web1" {
  name                            = "ysjang-web1"
  resource_group_name             = azurerm_resource_group.ysjang_rg.name
  virtual_network_name            = azurerm_virtual_network.ysjang_vnet.name
  address_prefixes                = ["10.0.3.0/24"]
  default_outbound_access_enabled = false
}

resource "azurerm_subnet" "ysjang_web2" {
  name                            = "ysjang-web2"
  resource_group_name             = azurerm_resource_group.ysjang_rg.name
  virtual_network_name            = azurerm_virtual_network.ysjang_vnet.name
  address_prefixes                = ["10.0.4.0/24"]
  default_outbound_access_enabled = false
}

resource "azurerm_subnet" "ysjang_db" {
  name                            = "ysjang-db"
  resource_group_name             = azurerm_resource_group.ysjang_rg.name
  virtual_network_name            = azurerm_virtual_network.ysjang_vnet.name
  address_prefixes                = ["10.0.5.0/24"]
  default_outbound_access_enabled = false
}
