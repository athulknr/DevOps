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
resource "aws_vpc" "athul_vpc" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "demo-vpc-athul"
  }
}

resource "aws_subnet" "net1" {
  vpc_id            = aws_vpc.athul_vpc.id
  cidr_block        = "10.0.0.0/27"
  availability_zone = "ca-central-1a"
  tags = {
    Name = "Demo-sub"
  }
}