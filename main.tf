terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Change as per your region
}



#count
/*
resource "aws_s3_bucket" "example" {
  count = 2
  bucket = "my-tf-test-bucket-unique-name-${count.index + 1}" # Ensure the bucket name is globally unique

  tags = {
    Name        = "My bucket ${count.index + 1}"
    Environment = "Dev"
  }
}
*/



/*
data "aws_ami" "debug" {
  most_recent = true

  owners = ["099720109477"]
}
output "debug_ami_id" {
  value = data.aws_ami.debug.id
}


resource "aws_instance" "web" {
  count = 4
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld ${count.index + 1}"
  }
}


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