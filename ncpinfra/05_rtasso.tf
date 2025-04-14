resource "ncloud_route_table_association" "ysjang-rtasso" {
  route_table_no = ncloud_route_table.ysjang-rt.id
  subnet_no      = ncloud_subnet.ysjang-bas.id
}
resource "ncloud_route_table_association" "ysjang-rtasso2" {
  route_table_no = ncloud_route_table.ysjang-rt.id
  subnet_no      = ncloud_subnet.ysjang-nat.id
}
resource "ncloud_route_table_association" "ysjang-rtasso3" {
  route_table_no = ncloud_route_table.ysjang-rt.id
  subnet_no      = ncloud_subnet.ysjang-load.id
}
