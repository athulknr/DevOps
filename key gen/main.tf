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

resource "tls_private_key" "bashmum_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "bashmum_key" {
  key_name   = "bashmum"
  public_key = tls_private_key.bashmum_key.public_key_openssh
}

resource "local_file" "save_private_key" {
  content  = tls_private_key.bashmum_key.private_key_pem
  filename = "bashmum.pem"
}

resource "local_file" "save_public_key" {
  content  = tls_private_key.bashmum_key.public_key_openssh
  filename = "bashmum.pub"
}

resource "aws_instance" "server" {
  ami           = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.bashmum_key.key_name
  subnet_id     = "subnet-0fb5e22f5141ad22e"

  tags = {
    Name = "MumbaiServer"
  }
}
