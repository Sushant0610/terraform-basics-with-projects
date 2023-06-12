# Terraform Block
terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.55"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
}