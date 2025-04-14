resource "ncloud_mysql" "ysjang-mysql" {
  service_name                 = "mysql"
  subnet_no                    = ncloud_subnet.ysjang-db.id
  server_name_prefix           = "ysjang-mysql"
  user_name                    = "root1"
  user_password                = "It12345!"
  host_ip                      = "%"
  database_name                = "wordpress"
  is_ha                        = false
  data_storage_type            = "HDD"
  is_backup                    = false
}

output "private_dns" {
  value = ncloud_mysql.ysjang-mysql.mysql_server_list
}
