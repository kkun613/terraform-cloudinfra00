resource "ncloud_vpc" "ysjang-vpc" {
  name            = "ysjang-vpc"
  ipv4_cidr_block = var.cidr
}