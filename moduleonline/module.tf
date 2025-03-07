
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}


module "module_online" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "my module"

  instance_type          = "t2.micro"
  /*key_name               = " "
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"
  */
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}