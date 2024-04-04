terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.63.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
  }

  required_version = ">= 1.4.5"
}

provider "aws" {
  region = "us-east-1"
  # assume_role {
  #   role_arn = "arn:aws:iam::630033670620:role/terraform"
  # }
}