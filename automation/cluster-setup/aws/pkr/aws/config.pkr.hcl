packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "vault" {
  ami_name      = replace(replace("ise-akalaj-opspro2-${var.vault_version}", ".", ""), "+", "-")
  ssh_username  = var.ssh_username
  instance_type = var.instance_type
  region        = var.region
  source_ami    = var.source_ami
}

build {
  sources = ["source.amazon-ebs.vault"]

  provisioner "shell" {
    script = "../ansible/install_ansible.sh"
  }

  provisioner "ansible-local" {
    galaxy_file   = "../ansible/requirements.yml"
    playbook_file = "../ansible/install.yml"

    extra_arguments = [
      "--extra-vars",
      "'packer_build=true vault_version=${var.vault_version}'",
    ]
  }

  provisioner "shell" {
    script = "../ansible/uninstall_ansible.sh"
  }
}