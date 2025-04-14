resource "aws_route_table_association" "ysjang-rtasso" {
  subnet_id      = aws_subnet.ysjang-puba.id
  route_table_id = aws_route_table.ysjang-rt.id  
}

resource "aws_route_table_association" "ysjang-rtasso1" {
  subnet_id      = aws_subnet.ysjang-pubc.id
  route_table_id = aws_route_table.ysjang-rt.id  
}