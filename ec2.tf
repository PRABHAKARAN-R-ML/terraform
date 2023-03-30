resource "aws_instance" "myec2" {
  ami             = "ami-00c39f71452c08778"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.sample-public-subnet.id
  key_name        = "third"
  security_groups = [aws_security_group.sample-sg.id]
}

resource "aws_vpc" "sample-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "sample-public-subnet" {
  vpc_id                  = aws_vpc.sample-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "demo-public-subnet"
  }
}
resource "aws_internet_gateway" "sample-gateway" {
  vpc_id = aws_vpc.sample-vpc.id
  tags = {
    Name = "demo-gateway"
  }
}
resource "aws_route_table" "sample-route-table" {
  vpc_id = aws_vpc.sample-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-gateway.id
  }
  tags = {
    Name = "demo-public-rwt"
  }
}

resource "aws_route_table_association" "public-sub-association" {
  subnet_id      = aws_subnet.sample-public-subnet.id
  route_table_id = aws_route_table.sample-route-table.id
}


resource "aws_security_group" "sample-sg" {
  vpc_id = aws_vpc.sample-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
