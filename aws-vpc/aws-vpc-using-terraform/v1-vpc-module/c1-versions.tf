# Terraform Block
terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "sushant"
  region  = var.aws_region
}