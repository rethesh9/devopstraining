terraform {

  backend "s3" {
    bucket         = "rethesh-terraform-state"
    key            = "dev/rethesh/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = "true"
    dynamodb_table = "rethesh-roche-table"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
}

