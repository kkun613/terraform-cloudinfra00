resource "ncloud_route" "ysjang-natgwrt" {
  route_table_no         = ncloud_route_table.ysjang-natrt.id
  destination_cidr_block = "0.0.0.0/0"
  target_type            = "NATGW"
  target_name            = ncloud_nat_gateway.ysjang-natgw.name
  target_no              = ncloud_nat_gateway.ysjang-natgw.id
}
