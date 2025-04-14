data "ncloud_server_image_numbers" "kvm-image" {
  server_image_name = "rocky-9.4-base"
  filter {
    name   = "hypervisor_type"
    values = ["KVM"]
  }
}

resource "ncloud_public_ip" "ysjang-pip" {
  server_instance_no = ncloud_server.ysjang-bas.id
}

resource "ncloud_server" "ysjang-bas" {
  subnet_no           = ncloud_subnet.ysjang-bas.id
  name                = "ysjang-bas"
  server_image_number = data.ncloud_server_image_numbers.kvm-image.image_number_list[0].server_image_number
  server_spec_code    = "c2-g3"
  network_interface {
    network_interface_no = ncloud_network_interface.ysjang-nic.id
    order                = 0
  }
  init_script_no = ncloud_init_script.key.id
  fee_system_type_code = "MTRAT"
}

resource "ncloud_server" "ysjang-web1" {
  subnet_no           = ncloud_subnet.ysjang-web1.id
  name                = "ysjang-web1"
  server_image_number = data.ncloud_server_image_numbers.kvm-image.image_number_list[0].server_image_number
  server_spec_code    = "c2-g3"
  network_interface {
    network_interface_no = ncloud_network_interface.ysjang-nic1.id
    order                = 0
  }
  init_script_no = ncloud_init_script.word.id
  fee_system_type_code = "MTRAT"
}

resource "ncloud_server" "ysjang-web2" {
  subnet_no           = ncloud_subnet.ysjang-web2.id
  name                = "ysjang-web2"
  server_image_number = data.ncloud_server_image_numbers.kvm-image.image_number_list[0].server_image_number
  server_spec_code    = "c2-g3"
  network_interface {
    network_interface_no = ncloud_network_interface.ysjang-nic2.id
    order                = 0
  }
  init_script_no = ncloud_init_script.word.id
  fee_system_type_code = "MTRAT"
}

output "bas_public_ip" {
  value = ncloud_public_ip.ysjang-pip.public_ip
}

