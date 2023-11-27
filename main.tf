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