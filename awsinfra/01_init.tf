terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_key_pair" "ysjang-key" {
  key_name   = "ysjang-key"
  public_key = file("./ysjang.pub")  
}