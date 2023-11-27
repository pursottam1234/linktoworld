terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "avpctesting" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "avpctesting",
    Dept = "Sales" 
  }
}

resource "aws_subnet" "sub-us-east-1a" {
  vpc_id = aws_vpc.avpctesting.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "sub-us-east-1a"
  }
}

resource "aws_internet_gateway" "ig01" {
  tags = {
    Name = "ig001"
  }
}

resource "aws_internet_gateway_attachment" "igattach" {
  internet_gateway_id = aws_internet_gateway.ig01.id
  vpc_id              = aws_vpc.avpctesting.id
}

resource "aws_route_table" "routetb01" {
vpc_id              = aws_vpc.avpctesting.id
}

resource "aws_route" "route01" {
  route_table_id            = aws_route_table.routetb01.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.ig01.id
}

resource "aws_route_table_association" "routetbassoc01" {
  subnet_id      = aws_subnet.sub-us-east-1a.id
  route_table_id = aws_route_table.routetb01.id
}