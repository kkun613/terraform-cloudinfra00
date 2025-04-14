resource "aws_subnet" "ysjang-puba" {
  vpc_id            = aws_vpc.ysjang-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "ysjang-puba"
  }
}
resource "aws_subnet" "ysjang-pubc" {
  vpc_id            = aws_vpc.ysjang-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "ysjang-pubc"
  }
}

resource "aws_subnet" "ysjang-pria" {
  vpc_id            = aws_vpc.ysjang-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "ysjang-pria"
  }
}

resource "aws_subnet" "ysjang-pric" {
  vpc_id            = aws_vpc.ysjang-vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "ysjang-pric"
  }
}

resource "aws_subnet" "ysjang-dba" {
  vpc_id            = aws_vpc.ysjang-vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.region}a"
  tags = {
    Name = "ysjang-dba"
  }
}

resource "aws_subnet" "ysjang-dbc" {
  vpc_id            = aws_vpc.ysjang-vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "${var.region}c"
  tags = {
    Name = "ysjang-dbc"
  }
}
