resource "ncloud_route_table_association" "ysjang-natrtasso" {
  route_table_no = ncloud_route_table.ysjang-natrt.id
  subnet_no      = ncloud_subnet.ysjang-web1.id
}
resource "ncloud_route_table_association" "ysjang-natrtasso2" {
  route_table_no = ncloud_route_table.ysjang-natrt.id
  subnet_no      = ncloud_subnet.ysjang-web2.id
}
resource "ncloud_route_table_association" "ysjang-natrtasso3" {
  route_table_no = ncloud_route_table.ysjang-natrt.id
  subnet_no      = ncloud_subnet.ysjang-db.id
}
