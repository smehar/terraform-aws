data "aws_ami" "app_ami" {
  most_recent = true
  owners       = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instancetype
  availability_zone = var.a_zone
  key_name        = "devops"
  tags            = var.aws_common_tag
  security_groups = [var.sg_name]
  
  provisioner "remote-exec" {
     inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
     ]

   connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file("/media/sf_ubuntuShared/secret/devops.pem")
     host = self.public_ip
   }
  }

  provisioner "local-exec" {
    command = "echo {PUBLIC IP: ${var.public_ip}}>> ../ip_ec2.txt"
  }

  root_block_device {
    delete_on_termination = true
  }

}
