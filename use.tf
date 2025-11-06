terraform {

  backend "s3" {
    bucket         = "rethesh-terraform-state"
    key            = "dev/rethesh/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = "true"
    dynamodb_table = "rethesh-table-3"
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

module "rethesh-module" {
  source           = "./modules/ec2"
  rethesh-ami-id   = "ami-0a25a306450a2cba3"
  vm-name          = "rethesh-vm"
  vm-size          = "t2.nano"
  key_name         = "rethesh-public-key"
  private-key-algo = "RSA"
  key-size         = 4096
  my_vpc_id        = "vpc-02d56e9aa1ce2f114"
  security-grp-nm = "rethesh-sg-new"
  novm = 2
}