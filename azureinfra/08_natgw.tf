resource "azurerm_nat_gateway" "ysjang_nat" {
  name                = "ysjang-nat"
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  location            = azurerm_resource_group.ysjang_rg.location
  sku_name            = "Standard"
}

resource "azurerm_subnet_nat_gateway_association" "ysjang_sub_nat_assoc" {
  subnet_id      = azurerm_subnet.ysjang_nat.id
  nat_gateway_id = azurerm_nat_gateway.ysjang_nat.id
}

resource "azurerm_nat_gateway_public_ip_association" "ysjang_nat_ip_asso" {
  nat_gateway_id       = azurerm_nat_gateway.ysjang_nat.id
  public_ip_address_id = azurerm_public_ip.ysjang_nat_ip.id
}

resource "azurerm_subnet_nat_gateway_association" "ysjang_sub_nat_assoc1" {
  subnet_id      = azurerm_subnet.ysjang_web1.id
  nat_gateway_id = azurerm_nat_gateway.ysjang_nat.id
}

resource "azurerm_subnet_nat_gateway_association" "ysjang_sub_nat_assoc2" {
  subnet_id      = azurerm_subnet.ysjang_web2.id
  nat_gateway_id = azurerm_nat_gateway.ysjang_nat.id
}

resource "azurerm_subnet_nat_gateway_association" "ysjang_sub_nat_assoc3" {
  subnet_id      = azurerm_subnet.ysjang_db.id
  nat_gateway_id = azurerm_nat_gateway.ysjang_nat.id
}
