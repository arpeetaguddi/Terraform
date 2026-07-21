provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "webserver" {
  key_name                = var.this_key_name
  ami                     = var.this_ami
  instance_type           = var.This_instance_type

  subnet_id               = "subnet-0fa7af11bd33fa518"
  vpc_security_group_ids  = [var.This_vpc_security_group_ids]

  count                   = var.this_count
  disable_api_termination = var.this_disable_api_termination

  tags = {
    Name = "Basic-EC2"
  }
}

resource "aws_security_group" "webserversg" {
  name  = "webserversg"
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}



output "instancepubip" {
  value = aws_instance.webserver.public_ip
} 

output "instanceid" {
  value = aws_instance.webserver.id 
}

