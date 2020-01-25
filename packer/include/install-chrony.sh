#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

apt-get update

# Remove ntpd
systemctl stop ntp
systemctl disable ntp

apt autoremove -q -y ntp*
apt purge -q -y ntp*

rm -f /etc/init.d/ntp

# Install chrony
apt -y -q install chrony

if [[ -f /etc/chrony/chrony.conf ]]; then
    cp -f /etc/chrony/chrony.conf "/home/${SSH_USERNAME}/tmp/chrony.conf"
fi

cat > /etc/chrony/chrony.conf <<EOL
server 169.254.169.123 prefer iburst
pool 0.debian.pool.ntp.org iburst
pool 1.debian.pool.ntp.org iburst
pool 2.debian.pool.ntp.org iburst
pool 3.debian.pool.ntp.org iburst

EOL

if [[ -f "/home/${SSH_USERNAME}/tmp/chrony.conf" ]]; then
    sed -- 's/pool/#pool/g' "/home/${SSH_USERNAME}/tmp/chrony.conf" >> /etc/chrony/chrony.conf
fi

systemctl restart chrony

if [[ -f "/home/${SSH_USERNAME}/tmp/chrony.conf" ]]; then
    rm -f "/home/${SSH_USERNAME}/tmp/chrony.conf"
fi