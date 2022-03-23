variable "instancetype" {
  type        = string
  description = "set aws instance type"
  default     = "t2.micro"
}

variable "a_zone" {
  type        = string
  description = "set availiability zone"
  default     = "us-east-1a"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "Set aws tag"
  default = {
    Name = "ec2-terraform-nginx"
  }
}
variable "sg_name" {
  type    = string
  default = "terraform-sg"
}

variable "public_ip" {
  type    = string
  default = "NULL"
}
