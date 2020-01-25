#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

# Install Docker CE to Ubuntu-16.04 / AWS
# See https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-using-the-repository for more details

apt-get remove docker docker-engine docker.io
apt-get update
apt-get install -y -q \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y -q docker-ce docker-ce-cli containerd.io

curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
