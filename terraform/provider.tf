locals {
  region = "us-east-1"
  name   = "kastro-eks-cluster"
  vpc_cidr = "10.123.0.0/16"
  azs      = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.123.1.0/24", "10.123.2.0/24"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  isolated_subnets   = ["10.123.5.0/24", "10.123.6.0/24"]  # changed from intra_subnets
  tags = {
    Example = local.name
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}

provider "aws" {
  region = local.region
}
