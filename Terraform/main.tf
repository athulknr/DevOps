terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-instance" {
  ami           = "ami-0fa3fe0fa7920f68e"
  instance_type = "t3.micro"

  tags = {
    Name = "demo"
    Environment = "Dev"
  }
}


