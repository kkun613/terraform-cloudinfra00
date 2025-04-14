resource "ncloud_nat_gateway" "ysjang-natgw" {
  vpc_no = ncloud_vpc.ysjang-vpc.id
  subnet_no = ncloud_subnet.ysjang-nat.id
  name = "ysjang-natgw"
  zone = "KR-1"
}