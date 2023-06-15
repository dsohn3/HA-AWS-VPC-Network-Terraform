#Create VPC
resource "aws_vpc" "vpc-1" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = { 
    Name = "${var.project_name}-vpc"
  }
}
#Create IGW & Attach VPC
resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.vpc-1.id
  
  tags = {
  Name = "${var.project_name}-igw" 
    }
}

#Setup Availability Zones
data "aws_availability_zones" "available_zones" {}

#Create Public Subnets
resource "aws_subnet" "public-sn-az1" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = var.public-sn-az1-cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sn-az1"
  }
}

resource "aws_subnet" "public-sn-az2" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = var.public-sn-az2-cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-sn-az2"
  }
}

#Create Route Table & Public Route
resource "aws_route_table" "rt-1" {
  vpc_id = aws_vpc.vpc-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }

  tags = {
    Name = "public-route-table"
  }
}
#Associate Subnets w/ Route Table - AZ1
resource "aws_route_table_association" "public-sn-az1" {
    subnet_id = aws_subnet.public-sn-az1.id
    route_table_id = aws_route_table.rt-1.id 
}

#Associate Subnets w/ Route Table - AZ2
resource "aws_route_table_association" "public-sn-az2" {
    subnet_id = aws_subnet.public-sn-az2.id
    route_table_id = aws_route_table.rt-1.id
}

#Create Private App Subnets
resource "aws_subnet" "private-app-sn-az1" {
  vpc_id = aws_vpc.vpc-1.id
  cidr_block = var.private-app-sn-az1-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-app-sn-az1"
  }
}
resource "aws_subnet" "private-app-sn-az2" {
  vpc_id = aws_vpc.vpc-1.id
  cidr_block = var.private-app-sn-az2-cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-app-sn-az2"
    }
}

#Create Private Data Subnets
resource "aws_subnet" "private-data-sn-az1" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = var.private-data-sn-az1-cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-data-sn-az1-cidr"
  }
}

resource "aws_subnet" "private-data-sn-az2" {
  vpc_id                  = aws_vpc.vpc-1.id
  cidr_block              = var.private-data-sn-az2-cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-data-sn-az2-cidr"
  }
}