provider "aws" {
  region  = "us-east-1"
  profile = "monte"
}

// Create EC2 Instance
resource "aws_instance" "vm1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  key_name               = var.key_name
  vpc_security_group_ids = var.security_groups
  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }
}

// Create VPC
resource "aws_vpc" "vpc1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "terravpc"
  }
}

// Create Two Public Subnet 
resource "aws_subnet" "publicsub1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "pubsubnet1"
  }
}

resource "aws_subnet" "publicsub2" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "pubsubnet2"
  }
}
// Create IGW
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "terraigw"
  }
}

// Create Route Table 
resource "aws_route_table" "route1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.igw1.id
  }
  tags = {
    Name = "routetable1"
  }
}

// Subnet Associations For Route Table
resource "aws_route_table_association" "routeass1" {
  subnet_id      = aws_subnet.publicsub1.id
  route_table_id = aws_route_table.route1.id
}