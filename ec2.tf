#Create EC2 Instance
resource "aws_instance" "webserver" {
  ami                    = "ami-0dd555eb7eb3b7c82"
  instance_type          = var.instance_type
  availability_zone      = "eu-west-2a"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  subnet_id              = aws_subnet.web-subnet.id

  tags = {
    Name = "Web Server"
  }
}

resource "aws_instance" "appserver" {
  ami                    = "ami-0dd555eb7eb3b7c82"
  instance_type          = "t2.micro"
  availability_zone      = "eu-west-2a"
  vpc_security_group_ids = [aws_security_group.appserver-sg.id]
  subnet_id              = aws_subnet.application-subnet.id

  tags = {
    Name = "app Server"
  }
}
