resource "aws_vpc" "sample-vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "sample-public-subnet" {
  vpc_id                  = aws_vpc.sample-vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = "true"
  availability_zone       = var.subnet_availabilty_zone
  tags = {
    Name = var.public_subnet_name
  }
}
resource "aws_internet_gateway" "sample-gateway" {
  vpc_id = aws_vpc.sample-vpc.id
  tags = {
    Name = var.gateway_name
  }
}
resource "aws_route_table" "sample-route-table" {
  vpc_id = aws_vpc.sample-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-gateway.id
  }
  tags = {
    Name = var.route_table_name
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

