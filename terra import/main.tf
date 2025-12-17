terraform{
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "import" {
    ami                                  = "ami-068c0051b15cdb816"
    instance_type                        = "t3.micro"
}