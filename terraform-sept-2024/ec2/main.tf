resource "aws_instance" "ec2-instance" {
    ami = var.ami
    key_name = "terraform-sept"
    instance_type = var.instance_type
    tags = {
      Name = "Ec2-terraform3"
    }
}


