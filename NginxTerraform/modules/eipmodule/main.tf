resource "aws_eip" "lb" {
  #instance = aws_instance.myec2.id
  vpc      = true
  provisioner "local-exec" {
    command = "echo {PUBLIC IP: ${aws_eip.lb.public_ip}}>> ../infos_ec2.txt"
  }
}
