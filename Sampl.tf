

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

#provider "aws" {
 # profile = "default"
 # region  = "us-east-1"
#}

#resource "aws_instance" "my_app_server" {
#  ami           = "ami-0d5eff06f840b45e9"
 # instance_type = "t2.micro"

 # tags = {
 #   Name = "myinstance27"
 # }
#}


resource "aws_vpc" "Production" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "Pro_Vpc"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.Production.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Pro_Subnet"
  }
}