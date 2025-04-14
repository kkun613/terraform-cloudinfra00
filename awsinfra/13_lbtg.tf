resource "aws_lb_target_group" "ysjang-lbtg" {
  name     = "ysjang-lbtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ysjang-vpc.id
  health_check {
    enabled             = true
    path                = "/health.html"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 3
    matcher             = "200"
    unhealthy_threshold = 3
    timeout             = 2
    interval            = 5
  }
  tags = {
    Name = "ysjang-lbtg"
  }
}
