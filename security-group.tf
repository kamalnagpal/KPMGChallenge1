# Create Web Security Group
resource "aws_security_group" "web-sg" {
  name        = "Web-SG"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.my-vpc.id

  //add egress and ingress rules
  tags = {
    Name = "Web-SG"
  }
}

# Create Application Security Group
resource "aws_security_group" "appserver-sg" {
  name        = "Appserver-SG"
  description = "Allow inbound traffic from web server"
  vpc_id      = aws_vpc.my-vpc.id

  tags = {
    Name = "Appserver-SG"
  }
}

# Create Database Security Group
resource "aws_security_group" "database-sg" {
  name        = "Database-SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.my-vpc.id

  tags = {
    Name = "Database-SG"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "mysql"
  engine_version         = "8.0.20"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "mydb"
  username               = "username"
  password               = "password"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet.id]

  tags = {
    Name = "My DB subnet group"
  }
}
