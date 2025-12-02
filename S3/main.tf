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
provider "aws" {
  region = "ap-southeast-2"  
  alias  = "south-2"
}
provider "aws" {
  region = "ap-south-1"
    alias  = "west-1"
}

resource "aws_s3_bucket" "us_bucket_athul" {
  bucket = "devops-athul-canada"
}

resource "aws_s3_bucket" "ohio_bucket" {
  bucket = "devops-ohio-devops"
  provider = aws.south-2
}

resource "aws_s3_bucket" "mumbai_bucket_athul" {
  bucket = "devops-athul-west1"
  provider = aws.west-1
}

