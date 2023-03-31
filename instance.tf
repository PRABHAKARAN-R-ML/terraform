resource "aws_instance" "myec2" {
  ami             = var.Ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.sample-public-subnet.id
  key_name        = "third"
  security_groups = [aws_security_group.sample-sg.id]
}

