resource "aws_instance" "bastion_host_east" {
  ami                         = "ami-06d0f03c7c1fd49c8"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.access_key_east.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.akalaj_opspro_sec_group_east.id]
  subnet_id                   = module.secondary_us_vpc.public_subnets[0]

  provider = aws.us-east

  tags = {
    Name     = "Akalaj-OpsPro-Bastion-Host-East"
    CreateBy = "Terraform"
    Owner    = "Alexander Kalaj"
    Team     = "ISE"
  }
}
