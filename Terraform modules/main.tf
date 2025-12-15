terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  aws_region          = var.aws_region
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_id    = module.vpc.public_subnet_id
  vpc_id       = module.vpc.vpc_id
  key_name     = var.key_name
  instance_type = var.instance_type
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}
