resource "ncloud_subnet" "ysjang-bas" {
  vpc_no         = ncloud_vpc.ysjang-vpc.id
  subnet         = "10.0.0.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.ysjang-vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  name           = "ysjang-bas"
  usage_type     = "GEN"
}
resource "ncloud_subnet" "ysjang-load" {
  vpc_no         = ncloud_vpc.ysjang-vpc.id
  subnet         = "10.0.1.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.ysjang-vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  name           = "ysjang-load"
  usage_type     = "LOADB"
}
resource "ncloud_subnet" "ysjang-nat" {
  vpc_no         = ncloud_vpc.ysjang-vpc.id
  subnet         = "10.0.2.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.ysjang-vpc.default_network_acl_no
  subnet_type    = "PUBLIC"
  name           = "ysjang-nat"
  usage_type     = "NATGW"
}
resource "ncloud_subnet" "ysjang-web1" {
  vpc_no         = ncloud_vpc.ysjang-vpc.id
  subnet         = "10.0.3.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.ysjang-vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  name           = "ysjang-web1"
  usage_type     = "GEN"
}
resource "ncloud_subnet" "ysjang-web2" {
  vpc_no         = ncloud_vpc.ysjang-vpc.id
  subnet         = "10.0.4.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.ysjang-vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  name           = "ysjang-web2"
  usage_type     = "GEN"
}
resource "ncloud_subnet" "ysjang-db" {
  vpc_no         = ncloud_vpc.ysjang-vpc.id
  subnet         = "10.0.5.0/24"
  zone           = "KR-1"
  network_acl_no = ncloud_vpc.ysjang-vpc.default_network_acl_no
  subnet_type    = "PRIVATE"
  name           = "ysjang-db"
  usage_type     = "GEN"
}
