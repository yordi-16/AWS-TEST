pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                stage('create S3') {
                  steps {
                    terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}
resource "aws_s3_bucket" "Firstname2" {
  bucket = "nonvigno-bucket15"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
            }
        }
    }
}
    }
}
