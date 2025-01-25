resource "aws_instance" "ec2-instance" {
    ami = "ami-0d2614eafc1b0e4d2"
    key_name = "terraform-sept"
    instance_type = "t2.micro"
    tags = {
      Name = "Ec2-terraform"
    }
}

provider "aws" {
    region = "ap-south-1"
}

provider "aws" {
    alias = "singapore"
    region = "ap-southeast-1"
}

resource "aws_instance" "ec2-ins" {
    ami = "ami-0d2614eafc1b0e4d2"
    provider = aws.singapore
    key_name = "terraform-sept"
    instance_type = "t2.micro"
    tags = {
      Name = "Ec2-terraform-singapore"
    }
}