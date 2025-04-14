data "aws_ami" "ysjang-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10*-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_eip_association" "ysjang-eassoc" {
  instance_id   = aws_instance.ysjang-web1.id
  allocation_id = aws_eip.ysjang-eip1.id
}

resource "aws_instance" "ysjang-web1" {
  ami                    = data.aws_ami.ysjang-ami.id
  instance_type          = "t2.micro"
  key_name               = "ysjang-key"
  vpc_security_group_ids = [aws_security_group.ysjang-sg.id]
  availability_zone      = "ap-northeast-2a"
  subnet_id              = aws_subnet.ysjang-puba.id
  private_ip             = "10.0.0.11"
  #associate_public_ip_address = true
  user_data = file("userdata.sh")
}

resource "aws_eip" "ysjang-eip1" {
  domain = "vpc"
}
output "instance_ip" {
  value = aws_eip.ysjang-eip1.public_ip
}
