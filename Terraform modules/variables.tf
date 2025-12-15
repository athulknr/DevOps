variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  description = "Existing EC2 Key Pair"
}

variable "bucket_name" {
  description = "Unique S3 bucket name"
}
