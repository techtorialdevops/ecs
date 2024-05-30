provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "alb" {
  source = "./alb"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "ecs" {
  source = "./ecs-cluster"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}

module "rds" {
  source = "./rds"
  vpc_id = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}
