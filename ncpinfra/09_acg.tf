resource "ncloud_access_control_group" "ysjang-acg" {
  name   = "ysjang-acg"
  vpc_no = ncloud_vpc.ysjang-vpc.id
}

resource "ncloud_access_control_group_rule" "ysjang-acgrule" {
  access_control_group_no = ncloud_access_control_group.ysjang-acg.id

  inbound {
    protocol    = "TCP"
    port_range  = "22"
    ip_block    = "0.0.0.0/0"
    description = "Allow SSH inbound traffic"
  }

  inbound {
    protocol    = "TCP"
    port_range  = "80"
    ip_block    = "0.0.0.0/0"
    description = "Allow HTTP inbound traffic"
  }

  inbound {
    protocol    = "TCP"
    port_range  = "3306"
    ip_block    = "0.0.0.0/0"
    description = "Allow MySQL inbound traffic"
  }

  inbound {
    protocol    = "ICMP"
    ip_block    = "0.0.0.0/0"
    description = "Allow ICMP inbound traffic"
  }

  outbound {
    protocol    = "TCP"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
    description = "Allow all outbound traffic"
  }

  outbound {
    protocol    = "ICMP"
    ip_block    = "0.0.0.0/0"
    description = "Allow ICMP outbound traffic"
  }

  outbound {
    protocol    = "UDP"
    ip_block    = "0.0.0.0/0"
    port_range  = "1-65535"
    description = "Allow all outbound traffic"
  }
}

/*
data "ncloud_access_control_group" "selected" {
  id = ncloud_mysql.ysjang-mysql.id
}
*/

resource "ncloud_access_control_group_rule" "mysql-acgrule" {
  access_control_group_no = ncloud_mysql.ysjang-mysql.access_control_group_no_list[0]

  inbound {
    protocol   = "TCP"
    port_range = "3306"
    ip_block   = "10.0.0.0/16"

  }

  outbound {
    protocol   = "TCP"
    ip_block   = "0.0.0.0/0"
    port_range = "3306"
  }
}
