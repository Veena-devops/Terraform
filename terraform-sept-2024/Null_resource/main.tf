provider "aws" {
    region = "ap-south-1"
}


data "aws_instance" "data_ec2" {
  filter {
    name   = "tag:Name"
    values = ["Ec2-terraform2"]
  }

  filter {
    name   = "image-id"
    values = ["ami-0d2614eafc1b0e4d2"]
  }

}


resource "null_resource" "terraform-ec2" {
     connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraform-sept.pem")
    host = data.aws_instance.data_ec2.public_ip
  }


provisioner "file" {
    source = "./inline.sh"
    destination = "/home/ec2-user/inline.sh"
}

provisioner "remote-exec" {
    inline = [ 
        "sh /home/ec2-user/inline.sh",
        "touch /home/ec2-user/random.txt"
     ]
  
}


}