resource "aws_kms_key" "vault_auto_unseal" {
  description = "KMS Key For Akalaj OpsPro auto-unseal"

  tags = {
    Name     = "Akalaj-OpsPro-KMS"
    CreateBy = "Terraform"
    Owner    = "Alexander Kalaj"
    Team     = "ISE"
  }
}


resource "aws_kms_alias" "vault_auto_unseal" {
  name          = "alias/akalaj-opspro-kms-key"
  target_key_id = aws_kms_key.vault_auto_unseal.id
}
