resource "aws_instance" "webserver" {
  key_name               = var.this_key_name
  ami                    = var.this_ami
  instance_type          = var.This_instance_type
  vpc_security_group_ids = [var.This_vpc_security_group_ids]
  count                  = var.this_count

  disable_api_termination = var.this_disable_api_termination

  tags = {
    Name = "Basic-EC2"
  }
}

