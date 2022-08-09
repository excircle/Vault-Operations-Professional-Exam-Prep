#!/bin/bash
set -e

if [ -f /etc/os-release ]; then
    . /etc/os-release
fi

if [ $ID == "ubuntu" ] || [ $ID == "debian" ]; then
    export DEBIAN_FRONTEND=noninteractive

    sudo apt update --yes
    sudo apt install --yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" gnupg2
    sudo apt upgrade --yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
    sudo apt install --yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" software-properties-common
    sudo apt install --yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" ansible git jq
elif [ $ID == "centos" ] || [ $ID == "rhel" ]; then
    sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
    sudo sed -i 's/$releasever/8/g' /etc/yum.repos.d/epel*.repo
    sudo yum -y update
    sudo yum install -y ansible git jq
fi