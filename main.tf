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
