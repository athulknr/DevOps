terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "sg" {
  vpc_id      = "vpc-041c5754079eb35e2"
  name        = "terraform-sg"
  description = "Security group by Terraform"

  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "demo" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name               = "key-aws"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id             = "subnet-0fb5e22f5141ad22e"
  tags = {
    Name = "Web-Server"
  }
}
resource "aws_instance" "demo2" {
  ami                    = "ami-0d176f79571d18a8f"
  instance_type          = "t3.micro"
  key_name               = "key-aws"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id             = "subnet-0fb5e22f5141ad22e"
  associate_public_ip_address = true

 user_data = file("data.sh")
  

  tags = {
    Name = "Terraform"
  }
}