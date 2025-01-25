provider "aws" {
    region = "ap-south-1"
}


resource "aws_instance" "ec2-instance" {
    ami = "ami-0d2614eafc1b0e4d2"
    key_name = "terraform-sept"
    instance_type = "t3.micro"
    tags = {
      Name = "Ec2-terraform1"
    }
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraform-sept.pem")
    #host     = self.public_ip
    host = aws_instance.ec2-instance.public_ip
  }
  provisioner "file" {
    source      = "./shell-script-file.sh"
    destination = "/home/ec2-user/shell-script-file.sh"
  }

 provisioner "remote-exec" {
    inline = [
      "bash /home/ec2-user/shell-script-file.sh",
      "touch /home/ec2-user/test.txt"
    ]
  }



}


