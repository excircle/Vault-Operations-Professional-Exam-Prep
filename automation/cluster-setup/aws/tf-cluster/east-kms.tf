resource "aws_kms_key" "vault_auto_unseal_east" {
  description = "KMS Key For Akalaj OpsPro auto-unseal"

  provider = aws.us-east

  tags = {
    Name     = "Akalaj-OpsPro-KMS-East"
    CreateBy = "Terraform"
    Owner    = "Alexander Kalaj"
    Team     = "ISE"
  }
}


resource "aws_kms_alias" "vault_auto_unseal_east" {
  name          = "alias/akalaj-opspro-kms-key-east"
  target_key_id = aws_kms_key.vault_auto_unseal_east.id
  provider      = aws.us-east
}
