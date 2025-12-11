
###### input variables ##########
variable "ami"{}
variable "type"{}
variable "sub"{}

###### output variables ##########

output "instance_id" {
  value = aws_instance.my_ec2.id
}
output "public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "instance_arn" {
  value = aws_instance.my_ec2.arn
}
output "private_ip" {
  value = aws_instance.my_ec2.private_ip
}