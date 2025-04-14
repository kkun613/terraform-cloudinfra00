resource "ncloud_lb_listener" "ysjang-lbl" {
  load_balancer_no = ncloud_lb.ysjang-lb.id
  protocol         = "HTTP"
  port             = 80
  target_group_no  = ncloud_lb_target_group.ysjang-lbtg.id
}
