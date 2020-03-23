#!/bin/bash -eux
export DEBIAN_FRONTEND="noninteractive"

echo "deb http://deb.debian.org/debian/ unstable main" > /etc/apt/sources.list.d/unstable-wireguard.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 90\n' > /etc/apt/preferences.d/limit-unstable

apt-get update -y -q

apt-get install -y -q wireguard wireguard-dkms


# WIREGUARD_DKMS_INSTALLED=$(dkms status | grep wireguard)
# if [[ "${WIREGUARD_DKMS_INSTALLED}" == "" ]]; then
#     echo "wireguard-dkms is not installed!"
#     exit 1
# fi

# WIREGUARD_MOD_FILE="/etc/modules-load.d/wireguard.conf"
# if [[ ! -f "${WIREGUARD_MOD_FILE}" ]]; then

#     cat <<EOT >> "${WIREGUARD_MOD_FILE}"
# wireguard
# EOT

# fi

# systemctl restart systemd-modules-load.service

# systemctl status systemd-modules-load.service

# WIREGUARD_DKMS_MODPROBE=$(lsmod | grep wireguard)
# if [[ "${WIREGUARD_DKMS_MODPROBE}" == "" ]]; then
#     echo "Module wireguard is not enabled!"
#     exit 1
# fi
