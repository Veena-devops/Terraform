provider "aws" {
    region = "ap-south-1"
}


# data "aws_instance" "data-ec2" {
#   instance_tags = { 
#     Name= "terraform-server"
#   }
 
# }

# output "Data-id" {
#    # value = data.<resource_type>.<resource_name>.<identifier>
#   value = data.aws_instance.data-ec2.id
# }

# output "public-ip" {
#    # value = data.<resource_type>.<resource_name>.<identifier>
#   value = data.aws_instance.data-ec2.public_ip
# }


data "aws_subnet" "terra-sub" {
  filter {
    name   = "tag:Name"
    values = ["vpc-subnet"]
  }
}

resource "aws_instance" "ec2-instance" {
    ami = "ami-0d2614eafc1b0e4d2"
    key_name = "terraform-sept"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.terra-sub.id
    tags = {
      Name = "Ec2-terraform"
    }
}


