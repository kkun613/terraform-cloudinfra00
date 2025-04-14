resource "aws_lb" "ysjang-lb" {
  name                             = "ysjang-lb"
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [aws_security_group.ysjang-sg.id]
  subnets                          = [aws_subnet.ysjang-puba.id, aws_subnet.ysjang-pubc.id]
  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true
  tags = {
    Name = "ysjang-lb"
  }
}

output "Lb_dns" {
  value = aws_lb.ysjang-lb.dns_name
}
