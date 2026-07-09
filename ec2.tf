# 1. Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# 2. Launch a minimal EC2 Instance
resource "aws_instance" "minimal_ec2" {
  ami           = "ami-01a18c38ece67e620" 
  instance_type = "t2.micro"

  tags = {
    Name = "Basic-EC2"
  }
}
