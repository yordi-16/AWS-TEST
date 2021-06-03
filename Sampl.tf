

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

resource "aws_instance" "my_app_servers" {
   ami           = "aws_ami-0b0af3577fe5e3532"
   instance_type = "t2.micro"

   tags = {
     Name = "myinstances30"
   }
 }
