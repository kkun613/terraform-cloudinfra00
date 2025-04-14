resource "aws_launch_template" "ysjang-lt" {
  name_prefix = "ysjang-lt"
  image_id    = aws_ami_from_instance.ysjang-inami.id
  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 10
      volume_type = "gp2"
    }
  }
  instance_type          = "t2.micro"
  key_name               = "ysjang-key"
  vpc_security_group_ids = [aws_security_group.ysjang-sg.id]
  user_data              = filebase64("userdata.sh")
  #user_data = filebase64("$(path.module)/userdata.sh")
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ysjang-lt"
    }
  }
}
