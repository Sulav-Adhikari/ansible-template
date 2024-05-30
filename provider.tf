terraform {
  required_providers {
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.3.0"
    }
    aws = {
    source  = "hashicorp/aws"
    version = "~> 5.0"
    }
  }
}



# Configure the AWS Provider
provider "aws" {
  region = "eu-east-1"
}