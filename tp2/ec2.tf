provider "aws" {
    region ="us-east-1"    
    shared_credentials_file = "/media/sf_ubuntuShared/secret/credentials"    
}

resource "aws_instance" "myec2" {

  ami = "ami-0057d8e6fb0692b80"
  instance_type = "t2.micro"
  key_name      = "devops"
  tags = {
    Name = "ec2-terraform"
  }
  root_block_device {
    delete_on_termination = true
  }

}