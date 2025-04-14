resource "aws_ami_from_instance" "ysjang-inami" {
  name               = "ysjang-inami"
  source_instance_id = aws_instance.ysjang-web1.id
  depends_on = [ aws_instance.ysjang-web1 ]
  tags = {
    Name = "ysjang-inami"
  }
}