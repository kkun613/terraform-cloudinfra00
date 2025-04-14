resource "ncloud_route_table" "ysjang-rt" {
  vpc_no                = ncloud_vpc.ysjang-vpc.id
  supported_subnet_type = "PUBLIC"
  name                  = "ysjang-rt"
}

resource "ncloud_route_table" "ysjang-natrt" {
  vpc_no                = ncloud_vpc.ysjang-vpc.id
  supported_subnet_type = "PRIVATE"
  name                  = "ysjang-natrt"
}