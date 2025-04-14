resource "azurerm_dns_zone" "ysjang_dns" {
  name                = "kkun.store"
  resource_group_name = azurerm_resource_group.ysjang_rg.name
}

resource "azurerm_dns_a_record" "ysjang_www" {
  name = "www"
  zone_name = azurerm_dns_zone.ysjang_dns.name
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  ttl = 300
  records = [azurerm_public_ip.ysjang_appgw_ip.ip_address]
}