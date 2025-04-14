resource "ncloud_network_interface" "ysjang-nic" {
  name = "ysjang-nic"
  subnet_no = ncloud_subnet.ysjang-bas.id
  private_ip = "10.0.0.11"
  access_control_groups = [ncloud_access_control_group.ysjang-acg.id]
}

resource "ncloud_network_interface" "ysjang-nic1" {
  name = "ysjang-nic1"
  subnet_no = ncloud_subnet.ysjang-web1.id
  private_ip = "10.0.3.11"
  access_control_groups = [ncloud_access_control_group.ysjang-acg.id]
}

resource "ncloud_network_interface" "ysjang-nic2" {
  name = "ysjang-nic2"
  subnet_no = ncloud_subnet.ysjang-web2.id
  private_ip = "10.0.4.11"
  access_control_groups = [ncloud_access_control_group.ysjang-acg.id]
  
}

resource "ncloud_network_interface" "ysjang-nic3" {
  name = "ysjang-nic3"
  subnet_no = ncloud_subnet.ysjang-db.id
  private_ip = "10.0.5.11"
  access_control_groups = [ncloud_access_control_group.ysjang-acg.id]
  
}

