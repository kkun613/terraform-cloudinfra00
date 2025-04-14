resource "aws_route_table_association" "ysjang-natrtasso" {
  subnet_id      = aws_subnet.ysjang-pria.id
  route_table_id = aws_route_table.ysjang-natrt.id
}
resource "aws_route_table_association" "ysjang-natrtasso1" {
  subnet_id      = aws_subnet.ysjang-pric.id
  route_table_id = aws_route_table.ysjang-natrt.id
}

resource "aws_route_table_association" "ysjang-natrtasso2" {
  subnet_id      = aws_subnet.ysjang-dba.id
  route_table_id = aws_route_table.ysjang-natrt.id
}

resource "aws_route_table_association" "ysjang-natrtasso3" {
  subnet_id      = aws_subnet.ysjang-dbc.id
  route_table_id = aws_route_table.ysjang-natrt.id
}
