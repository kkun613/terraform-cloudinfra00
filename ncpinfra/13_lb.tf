resource "ncloud_lb" "ysjang-lb" {
  name           = "ysjang-lb"
  network_type   = "PUBLIC"
  type           = "APPLICATION"
  subnet_no_list = [ncloud_subnet.ysjang-load.id]
}

output "load_dns" {
  value = ncloud_lb.ysjang-lb.domain
}
