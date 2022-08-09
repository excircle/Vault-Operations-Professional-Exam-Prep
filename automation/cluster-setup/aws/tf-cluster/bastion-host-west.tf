resource "aws_instance" "bastion_host" {
  ami                         = "ami-0148e1a0d38fffc5e"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.access_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.akalaj_opspro_sec_group.id]
  subnet_id                   = module.primary_us_vpc.public_subnets[0]

  tags = {
    Name     = "Akalaj-OpsPro-Bastion-Host"
    CreateBy = "Terraform"
    Owner    = "Alexander Kalaj"
    Team     = "ISE"
  }
}
