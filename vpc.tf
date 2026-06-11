provider "aws" {
  region = local.region
}

locals {
  region = "eu-central-1"

  vpc_cidr = "10.123.0.0/16"
  azs = [eu-central-1a, eu-central-1b]

  public_subnets = ["10.123.1.0/24", "10.123.2.0/24"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  intra_subnets = ["10.123.5.0/24", "10.123.6.0/24"]

}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "qlee-test-vpc"
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  enable_nat_gateway = true

}