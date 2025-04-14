resource "aws_route_table" "ysjang-rt" {
  vpc_id = aws_vpc.ysjang-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ysjang-igw.id
  }
  tags = {
    Name = "ysjang-rt"
  }
}

resource "aws_route_table" "ysjang-natrt" {
  vpc_id = aws_vpc.ysjang-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ysjang-natgw.id   
  }
  tags = {
    Name = "ysjang-natrt"
  }
}
