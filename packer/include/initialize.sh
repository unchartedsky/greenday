#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

# Disable daily apt unattended updates.
# See https://gist.github.com/alpegon/563dd824ce54828de9f9c09dd1a6d204
# systemctl disable apt-daily.service
# systemctl disable apt-daily.timer

apt-get update

CODE_NAME="$(lsb_release -c -s)"

# Install utils
if [[ "${CODE_NAME}" == "bionic" ]]; then
    snap install jq
else
    apt-get install -y -q jq
fi

# Debian locales
DISTRIBUTOR_ID="$(lsb_release -i -s)"

if [[ "${DISTRIBUTOR_ID}" == "Debian" ]]; then
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
    echo "LANG=en_US.UTF-8" > /etc/locale.conf
    locale-gen
    dpkg-reconfigure locales
fi