resource "aws_nat_gateway" "ysjang-natgw" {
  allocation_id = aws_eip.ysjang-eip.id
  subnet_id     = aws_subnet.ysjang-puba.id
  tags = {
    Name = "ysjang-natgw"
  }  
  depends_on = [ aws_internet_gateway.ysjang-igw]
}

output "natgw_public_ip" {
  value = aws_eip.ysjang-eip.public_ip  
}