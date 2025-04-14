resource "aws_autoscaling_attachment" "ysjang-acat" {
  autoscaling_group_name = aws_autoscaling_group.ysjang-asg.id
  lb_target_group_arn = aws_lb_target_group.ysjang-lbtg.arn
  
}