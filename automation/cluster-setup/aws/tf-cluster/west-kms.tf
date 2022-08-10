resource "aws_kms_key" "vault_auto_unseal_west" {
  description = "KMS Key For Akalaj OpsPro auto-unseal"

  provider = aws.us-west

  tags = {
    Name     = "Akalaj-OpsPro-KMS-West"
    CreateBy = "Terraform"
    Owner    = "Alexander Kalaj"
    Team     = "ISE"
  }
}


resource "aws_kms_alias" "vault_auto_unseal_west" {
  name          = "alias/akalaj-opspro-kms-key-west"
  target_key_id = aws_kms_key.vault_auto_unseal_west.id
}
