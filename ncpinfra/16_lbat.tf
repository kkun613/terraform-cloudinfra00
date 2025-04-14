resource "ncloud_lb_target_group_attachment" "ysjang-lbat" {
  target_group_no = ncloud_lb_target_group.ysjang-lbtg.target_group_no
  target_no_list  = [ncloud_server.ysjang-web1.id, ncloud_server.ysjang-web2.id]
}
