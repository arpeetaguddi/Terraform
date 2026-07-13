# 1. Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# 2. Launch a minimal EC2 Instance
  resource "aws_instance" "webserver" {
   depends_on = [aws_security_group.webserversg] #explict dependency
   key_name = var.this_key_name
   ami = var.this_ami 
   instance_type = var.This_instance_type
   vpc_security_group_ids = [var.This_vpc_security_group_ids , aws_security_group.webserversg.id , data.aws_security_groups.defaultsg_search.id ]
   count = var.this_count
   
   disable_api_termination = var.this_disable_api_termination


  tags = {
    Name = "Basic-EC2"
  }
}
