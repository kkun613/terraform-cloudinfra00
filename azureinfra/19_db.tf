resource "azurerm_private_dns_zone" "ysjang_pdns" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.ysjang_rg.name

}

resource "azurerm_private_dns_zone_virtual_network_link" "ysjang_pdns_vnet_link" {
  name                  = "ysjang-pdns-vnetzone.com"
  resource_group_name   = azurerm_resource_group.ysjang_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.ysjang_pdns.name
  virtual_network_id    = azurerm_virtual_network.ysjang_vnet.id

}

resource "azurerm_mysql_flexible_server" "ysjang_mysql" {
  name                   = "ysjang-mysql"
  resource_group_name    = azurerm_resource_group.ysjang_rg.name
  location               = azurerm_resource_group.ysjang_rg.location
  administrator_login    = "ysjang"
  administrator_password = "It12345!"
  sku_name               = "B_Standard_B1ms"
  version                = "8.0.21"
}

resource "azurerm_private_endpoint" "ysjang_mysql_pe" {
  name                = "ysjang-mysql-pe"
  location            = azurerm_resource_group.ysjang_rg.location
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  subnet_id           = azurerm_subnet.ysjang_db.id

  private_service_connection {
    name                           = "mysql"
    private_connection_resource_id = azurerm_mysql_flexible_server.ysjang_mysql.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
  private_dns_zone_group {
    name                 = "mysql-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.ysjang_pdns.id]
  }
}

resource "azurerm_mysql_flexible_server_configuration" "ysjang_mysql_config" {
  name                = "require_secure_transport"
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  server_name         = azurerm_mysql_flexible_server.ysjang_mysql.name
  value               = "OFF"

}

resource "azurerm_mysql_flexible_database" "ysjang_mysql_db" {
  name                = "wordpress"
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  server_name         = azurerm_mysql_flexible_server.ysjang_mysql.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}
