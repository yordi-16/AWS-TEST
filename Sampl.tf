

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# resource "aws_instance" "my_app_server" {
#   ami           = data.aws_ami.amixx.id
#   instance_type = "t2.micro"

#   tags = {
#     Name = "myinstances32"
#   }
# }
resource "aws_s3_bucket" "Firstname2" {
  bucket = "nonvigno-bucket12"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

// variable
// varibale.tfvar
// variable "aws_access_key" {
#   "asdasdas"
# }

// provider

// data 
# data "aws_ami" "amixx" {
  
# }

// resource

// output 

# output "aws_public_ip" {
#   value = "aws_instance.my_app_server.public_dns"
# }