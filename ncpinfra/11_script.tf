
resource "ncloud_init_script" "word" {
    name = "word"
    content = file("${path.module}/word.sh")
  
}

resource "ncloud_init_script" "key" {
    name = "key"
    content = file("${path.module}/key.sh")
  
}