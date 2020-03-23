#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

echo "See https://www.digitalocean.com/community/tutorials/how-to-install-go-on-debian-9"

cd /tmp

curl -O https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
tar xvf go1.14.1.linux-amd64.tar.gz
chown -R root:root ./go
mv go /usr/local

mkdir -p "${SSH_USERHOME}/work"

tee -a "${SSH_USERHOME}/.profile" <<EOT

export GOPATH=\$HOME/work
export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin
EOT
