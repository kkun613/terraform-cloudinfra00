output "bat_public_ip" {
  value = azurerm_public_ip.ysjang_bat_ip.ip_address
}
output "nat_public_ip" {
  value = azurerm_public_ip.ysjang_nat_ip.ip_address
}
output "lb_public_ip" {
  value = azurerm_public_ip.ysjang_appgw_ip.ip_address
}