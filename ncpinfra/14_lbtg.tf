resource "ncloud_lb_target_group" "ysjang-lbtg" {
  name        = "ysjang-lbtg"
  protocol    = "HTTP"
  target_type = "VSVR"
  port        = 80
  vpc_no      = ncloud_vpc.ysjang-vpc.id
  health_check {
    protocol       = "HTTP"
    http_method    = "GET"
    url_path       = "/health.html"
    port           = 80
    cycle          = 5
    up_threshold   = 2
    down_threshold = 2
  }
  algorithm_type = "RR"
}
