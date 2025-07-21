terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Change this to your region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical (Ubuntu publisher)
}




resource "aws_instance" "web" {
  count = 4
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld ${count.index + 1}"
  }
}

/*
resource "aws_security_group" "sg" {
  count = 2
  name = "web_sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id = "vpc-12345678+{index.value}" # Replace with your VPC ID

  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
  
}
*/