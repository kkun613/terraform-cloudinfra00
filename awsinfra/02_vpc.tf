resource "aws_vpc" "ysjang-vpc" {
  cidr_block = var.cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "ysjang-vpc"
  }
}
output "owner_id" {
  value = aws_vpc.ysjang-vpc.owner_id  
}