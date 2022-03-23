
resource "aws_ebs_volume" "ebs_terraform" {
  availability_zone = var.a_zone
  size              = var.size_storage

  tags = {
    Name = "ebs_terraform"
  }
}