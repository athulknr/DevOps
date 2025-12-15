terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" ###Mumbai
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.type
  subnet_id     = var.sub
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "instance-demo"
  }
}
