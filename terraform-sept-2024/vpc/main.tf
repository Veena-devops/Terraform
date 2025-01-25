resource "aws_route_table_association" "Terraform-RTA" {
  subnet_id      = aws_subnet.Terraform-subnet.id
  route_table_id = aws_route_table.terraform-rt.id
  #depends_on = [ <resource_type>.<resource_name> ]
}

resource "aws_subnet" "Terraform-subnet" {
  vpc_id     = aws_vpc.Terraform-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "vpc-subnet"
  }
}

resource "aws_vpc" "Terraform-vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "VPC-TF"
  }
}



resource "aws_internet_gateway" "Terraform-Igw" {
  vpc_id = aws_vpc.Terraform-vpc.id

  tags = {
    Name = "Terraform-IGW"
  }
}

resource "aws_route_table" "terraform-rt" {
  vpc_id = aws_vpc.Terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraform-Igw.id
  }

  tags = {
    Name = "TF-RT"
  }
}




# resource "aws_security_group" "terraform-sg" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.Terraform-vpc.id

#    ingress {
#     from_port       = 22
#     to_port         = 22
#     protocol        = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "terraform-sg"
#   }
# }

# resource "aws_instance" "ec2-instance" {
#     ami = "ami-0d2614eafc1b0e4d2"
#     key_name = "terraform-sept"
#     instance_type = "t2.micro"
#     subnet_id = aws_subnet.Terraform-subnet.id
#     vpc_security_group_ids = [aws_security_group.terraform-sg.id]
#     tags = {
#       Name = "Ec2-terraform"
#     }
# }

