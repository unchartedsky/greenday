#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

# Debian locales
DISTRIBUTOR_ID="$(lsb_release -i -s)"

if [[ "${DISTRIBUTOR_ID}" == "Debian" ]]; then
    "/home/${SSH_USERNAME}/tmp/wireguard/install-wireguard-on-debian.sh"
else
    "/home/${SSH_USERNAME}/tmp/wireguard/install-wireguard-on-ubuntu.sh"
fi