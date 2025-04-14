resource "aws_internet_gateway" "ysjang-igw" {
  vpc_id = aws_vpc.ysjang-vpc.id
  tags = {
    Name = "ysjang-igw"
  }
}
