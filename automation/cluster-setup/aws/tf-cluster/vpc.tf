module "primary_us_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  providers = {
    aws = aws.us-west
  }

  name            = "akalaj-opspro-vpc"
  cidr            = "10.64.0.0/22"
  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnets  = ["10.64.0.0/25", "10.64.1.0/25", "10.64.2.0/25"]
  private_subnets = ["10.64.0.128/25", "10.64.1.128/25", "10.64.2.128/25"]

  enable_dns_hostnames = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name     = "Akalaj-OpsPro-VPC-West"
    CreateBy = "Terraform"
    Owner    = "Alexander Kalaj"
    Team     = "ISE"
  }
}

module "secondary_us_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  providers = {
    aws = aws.us-east
  }

  name            = "akalaj-opspro-vpc"
  cidr            = "10.64.4.0/22"
  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnets  = ["10.64.4.0/25", "10.64.5.0/25", "10.64.6.0/25"]
  private_subnets = ["10.64.4.128/25", "10.64.5.128/25", "10.64.6.128/25"]

  enable_dns_hostnames = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name     = "Akalaj-OpsPro-VPC-East"
    CreateBy = "Terraform"
    Owner    = "Alexander Kalaj"
    Team     = "ISE"
  }
}
