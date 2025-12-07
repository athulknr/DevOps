terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.22.0"
    }
  }
}
#Metadata
######### Count #########

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
