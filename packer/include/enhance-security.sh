#!/bin/bash -eux
export DEBIAN_FRONTEND=noninteractive

# See https://superuser.com/questions/759481/ssh-how-to-change-value-in-config-file-in-one-command
apt-get -y -q install augeas-tools

# See https://serverfault.com/questions/216801/prevent-ssh-from-advertising-its-version-number
augtool --autosave 'set /files/etc/ssh/sshd_config/DebianBanner yes'

systemctl restart sshd

# rm -f /etc/update-motd.d/10-uname

cp -f "/home/${SSH_USERNAME}/tmp/etc/99-warn-text" /etc/update-motd.d/99-warn-text
chown root:root /etc/update-motd.d/99-warn-text
chmod 755 /etc/update-motd.d/99-warn-text

cp -f "/home/${SSH_USERNAME}/tmp/etc/issue" /etc/issue
chown root:root /etc/issue
chmod 644 /etc/issue

cp -f "/home/${SSH_USERNAME}/tmp/etc/issue.net" /etc/issue.net
chown root:root /etc/issue.net
chmod 644 /etc/issue.net