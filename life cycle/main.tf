terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami
  instance_type = var.insta
  subnet_id     = var.sub
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "instance-demo"
  }
}

output "instance_id" {
  value = aws_instance.my_ec2.id
}
output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "instance_arn" {
  value = aws_instance.my_ec2.arn
}
output "private_ip" {
  value = aws_instance.my_ec2.private_ip
}