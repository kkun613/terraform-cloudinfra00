resource "ncloud_launch_configuration" "ysjang-lc" {
  name                   = "ysjang-lc"
  member_server_image_no = "103723494"
  server_product_code    = "SVR.VSVR.HICPU.C002.M004.G003"
}

resource "ncloud_auto_scaling_group" "ysjang-auto" {
  access_control_group_no_list = [ncloud_access_control_group.ysjang-acg.id]
  subnet_no                    = ncloud_subnet.ysjang-web1.id
  min_size                     = 1
  max_size                     = 4
  launch_configuration_no      = ncloud_launch_configuration.ysjang-lc.id
}

resource "ncloud_auto_scaling_policy" "ysjang-auto-inc" {
  name                  = "ysjang-auto-inc"
  adjustment_type_code  = "CHANG"
  scaling_adjustment    = 1
  auto_scaling_group_no = ncloud_auto_scaling_group.ysjang-auto.id

}

resource "ncloud_auto_scaling_policy" "ysjang-auto-dec" {
  name                  = "ysjang-auto-dec"
  adjustment_type_code  = "CHANG"
  scaling_adjustment    = -1
  auto_scaling_group_no = ncloud_auto_scaling_group.ysjang-auto.id
}
