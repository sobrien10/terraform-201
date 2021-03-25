terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

#Configure the VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ob1-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false
  create_igw = true

  tags = {
    Terraform = "true"
    Environment = "ob1-env"
    uk-se = "OB1"
  }
}
