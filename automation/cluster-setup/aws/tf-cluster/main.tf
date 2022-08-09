module "us_west_2_cluster" {

  source = "./modules/accelerator"

  application_prefix    = "akalaj-opspro"
  load_balancing_scheme = "INTERNAL"
  auto_join_tag         = { "opspro-cluster-tag" : "opspro-cluster-tag" }
  aws_kms_key_id        = aws_kms_key.vault_auto_unseal.id
  aws_kms_region        = "us-west-2"
  machine_type          = "m5.large"

  network      = module.primary_us_vpc.vpc_id
  node_count   = 1
  packer_image = "ami-0148e1a0d38fffc5e"
  region       = "us-west-2"
  subnetworks  = module.primary_us_vpc.private_subnets

  machine_key_pair            = aws_key_pair.access_key.key_name
  security_group_ids          = [aws_security_group.akalaj_opspro_sec_group.id]
  skip_install_tools          = true
  vault_leader_tls_servername = "aws.alexkalaj.com"

  vault_seal_type          = "awskms"
  vault_license_secret     = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-license-pabLcH"
  vault_ca_bundle_secret   = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-ca-cert-QKDOzj"
  vault_private_key_secret = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-cert-key-pta5YV"
  vault_signed_cert_secret = "arn:aws:secretsmanager:us-west-2:849506427193:secret:opspro-cert-RZuXJR"

  tags = {
    CreateBy           = "Terraform"
    Owner              = "Alexander Kalaj"
    Team               = "ISE"
    opspro-cluster-tag = "opspro-cluster-tag"
  }
}