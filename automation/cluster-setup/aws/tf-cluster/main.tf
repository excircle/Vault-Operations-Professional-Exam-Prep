
module "us_west_2_cluster" {

  source = "./modules/accelerator"

  application_prefix    = "opspro-west"
  load_balancing_scheme = "INTERNAL"
  auto_join_tag         = { "opspro-cluster-tag" : "opspro-cluster-tag" }
  aws_kms_key_id        = aws_kms_key.vault_auto_unseal_west.id
  aws_kms_region        = "us-west-2"
  machine_type          = "m5.large"

  providers = {
    aws = aws.us-west
  }

  network      = module.primary_us_vpc.vpc_id
  node_count   = 1
  packer_image = "ami-0148e1a0d38fffc5e"
  region       = "us-west-2"
  subnetworks  = module.primary_us_vpc.private_subnets

  machine_key_pair            = aws_key_pair.access_key_west.key_name
  security_group_ids          = [aws_security_group.akalaj_opspro_sec_group_west.id]
  skip_install_tools          = true
  vault_leader_tls_servername = "aws.alexkalaj.com"

  vault_seal_type          = "awskms"
  vault_license_secret     = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-west-license3-MWFQSf"
  vault_ca_bundle_secret   = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-west-ca-eShZk9"
  vault_private_key_secret = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-west-cert-key-p1hFup"
  vault_signed_cert_secret = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-west-cert-2ZtKGA"

  tags = {
    CreateBy           = "Terraform"
    Owner              = "Alexander Kalaj"
    Team               = "ISE"
    opspro-cluster-tag = "opspro-cluster-tag"
  }
}


module "us_east_2_cluster" {

  source = "./modules/accelerator"

  application_prefix    = "opspro-east"
  load_balancing_scheme = "INTERNAL"
  auto_join_tag         = { "opspro-cluster-tag" : "opspro-cluster-tag" }
  aws_kms_key_id        = aws_kms_key.vault_auto_unseal_east.key_id
  aws_kms_region        = "us-east-2"
  machine_type          = "m5.large"

  providers = {
    aws = aws.us-east
  }

  network      = module.secondary_us_vpc.vpc_id
  node_count   = 1
  packer_image = "ami-0f3fe2d64b5f55069"
  region       = "us-east-2"
  subnetworks  = module.secondary_us_vpc.private_subnets

  machine_key_pair            = aws_key_pair.access_key_east.key_name
  security_group_ids          = [aws_security_group.akalaj_opspro_sec_group_east.id]
  skip_install_tools          = true
  vault_leader_tls_servername = "aws.alexkalaj.com"

  vault_seal_type          = "awskms"
  vault_license_secret     = "arn:aws:secretsmanager:us-east-2:849506427193:secret:opspro-east-license3-JcvtgC"
  vault_ca_bundle_secret   = "arn:aws:secretsmanager:us-east-2:849506427193:secret:opspro-east-ca-fogKrC"
  vault_private_key_secret = "arn:aws:secretsmanager:us-east-2:849506427193:secret:opspro-east-cert-key-eCTCnx"
  vault_signed_cert_secret = "arn:aws:secretsmanager:us-east-2:849506427193:secret:opspro-east-cert-fNO4RB"

  tags = {
    CreateBy           = "Terraform"
    Owner              = "Alexander Kalaj"
    Team               = "ISE"
    opspro-cluster-tag = "opspro-cluster-tag"
  }
}
