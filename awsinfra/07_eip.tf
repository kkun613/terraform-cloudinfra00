resource "aws_eip" "ysjang-eip" {
  domain = "vpc"
  tags = {
    Name = "ysjang-eip"
  }  
}