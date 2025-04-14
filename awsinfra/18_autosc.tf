resource "aws_autoscaling_group" "ysjang-asg" {
  name                      = "ysjang-asg"
  max_size                  = 6
  min_size                  = 1
  desired_capacity          = 1
  health_check_grace_period = 60
  health_check_type         = "EC2"
  force_delete              = false
  #vpc_zone_identifier       = concat(aws_subnet.ysjang-pub[*].id)
  vpc_zone_identifier = [aws_subnet.ysjang-puba.id, aws_subnet.ysjang-pubc.id]
  launch_template {
    id      = aws_launch_template.ysjang-lt.id
    version = "$Latest"
  }
}
