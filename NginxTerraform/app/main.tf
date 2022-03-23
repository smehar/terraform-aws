provider "aws" {
  region                  = "us-east-1"
  shared_credentials_files = ["/media/sf_ubuntuShared/secret/credentials"]
}

module "ec2" {
  source       = "../modules/ec2module"
  instancetype = "t2.micro"
  aws_common_tag = {
    Name = "ec2-nginx-teraform"
  }
  a_zone = "us-east-1a"
  sg_name= module.ec2_security_group.out_sg_name
  public_ip = module.ec2_eip.out_eip_ip
}

module "ec2_volume" {
  source       = "../modules/volumemodule"
  a_zone = "us-east-1a"
  size_storage = 4
}

module "ec2_eip" {
  source       = "../modules/eipmodule"
}

module "ec2_security_group" {
  source       = "../modules/sgmodule"
}

resource "aws_volume_attachment" "ebs-vol" {
 device_name = "/dev/sdh"
 volume_id = module.ec2_volume.out_volume_id
 instance_id = module.ec2.out_instance_id
 }

 resource "aws_eip_association" "eip_instance" {
  instance_id   = module.ec2.out_instance_id
  allocation_id = module.ec2_eip.out_eip_id
}