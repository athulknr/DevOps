terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.0"
    }
  }
}

###### Meta arguments ######
####### Count #######

provider "aws" {
  region = "ap-south-1"
}

resource "random_id" "rand" {
  byte_length = 4
}

resource "aws_instance" "server" {
  count         = 3
  ami           = "ami-0d176f79571d18a8f"
  instance_type = "t3.micro"

  tags = {
    Name = "server-${count.index}"
  }
}


########### for_each ###########

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "buckets" {
  for_each = {
    dev  = "dev"
    test = "test"
    prod = "prod"
  }

  bucket = "${each.key}-bucket-${random_id.suffix.hex}"
}


############## Depend on ##############

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
    Env  = "dev"
  }
}

resource "aws_subnet" "sub1" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.main.id

  depends_on = [
    aws_vpc.main
  ]

  tags = {
    Name = "subnet-1"
    Env  = "dev"
  }
}

############# Lifecycle ##############
###### create_before_destroy ######


