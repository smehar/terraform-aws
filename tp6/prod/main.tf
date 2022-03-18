provider "aws" {
  region     = "us-east-1"
  shared_credentials_file = "/media/sf_ubuntuShared/secret/credentials"
}
terraform {
  backend "s3" {
    bucket = "terraform-backend-tp"
    key    = "tp6-prod.tfstate"
    region = "us-east-1"
    shared_credentials_file = "/media/sf_ubuntuShared/secret/credentials"    
  }
}

module "ec2" {
    source = "../modules/ec2module"    
    instancetype = "t2.micro"
    aws_common_tag = {
        Name = "ec2-prod-teraform6"
    }
}