terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "demo" {
  ami           = "ami-09e7fb5d565f22127"
  instance_type = "t3.small" #change instance type

  tags = {
    Name = "Demo"
  }
}


