resource "aws_lb_listener" "ysjang-lbl" {
  load_balancer_arn = aws_lb.ysjang-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ysjang-lbtg.arn
  }
}
