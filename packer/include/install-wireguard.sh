#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

# Debian locales
DISTRIBUTOR_ID="$(lsb_release -i -s)"

if [[ "${DISTRIBUTOR_ID}" == "Debian" ]]; then
    "${SSH_USERHOME}/tmp/wireguard/install-wireguard-on-debian.sh"
else
    "${SSH_USERHOME}/tmp/wireguard/install-wireguard-on-ubuntu.sh"
fi

apt-get install -q -y iptables ipset
