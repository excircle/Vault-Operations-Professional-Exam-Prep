# General variables
variable "instance_type" {
  type        = string
  description = "(optional) The EC2 instance type to use while building the AMI"
  default     = "t2.large"
}

variable "ssh_username" {
  type        = string
  description = "(optional) The SSH username"
  default     = "admin"
}

variable "region" {
  type        = string
  description = "(optional) The zone to create the Packer image in"
  default     = "us-west-2"
}

variable "source_ami" {
  type        = string
  default     = "ami-071e6cafc48327ca2"
  description = "(required) The source AMI to use - Debian (8-9-22)"
}

variable "vault_version" {
  type        = string
  description = "(optional) The version of Vault to pull"
  default     = "1.10.3+ent"
}