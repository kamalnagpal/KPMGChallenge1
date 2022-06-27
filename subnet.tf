# Create Web Public Subnet
resource "aws_subnet" "web-subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Web"
  }
}

# Create Application Public Subnet
resource "aws_subnet" "application-subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Application"
  }
}

# Create Database Private Subnet
resource "aws_subnet" "database-subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Database"
  }
}