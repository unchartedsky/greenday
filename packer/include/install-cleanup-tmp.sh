#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

cp -f "${SSH_USERHOME}/tmp/services/cleanup-tmp.service" /etc/systemd/system/
cp -f "${SSH_USERHOME}/tmp/services/cleanup-tmp.timer" /etc/systemd/system/
chown root:root /etc/systemd/system/cleanup-tmp.service
chown root:root /etc/systemd/system/cleanup-tmp.timer
chmod 644 /etc/systemd/system/cleanup-tmp.service
chmod 644 /etc/systemd/system/cleanup-tmp.timer
systemctl daemon-reload
systemctl enable cleanup-tmp.service
systemctl enable cleanup-tmp.timer
