
# Wordpress 예제

모든 `bash` 스크립트는 [Bash 4에서 작동을 보장합니다.](http://clubmate.fi/upgrade-to-bash-4-in-mac-os-x/) (아무리 기본 쉘을 원칙으로 한다지만 Bash 3는 너무 구려요~)

``` bash
$ bash --version
GNU bash, version 4.4.23(1)-release (x86_64-apple-darwin17.5.0)
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

This is free software; you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```

## 설치

설치 스크립트 `install.sh`를 실행합니다. 일반적인 경우에 단 한번만 실행하면 됩니다.

``` bash
./install.sh
```

## `sshfs` 사용 예제

``` bash
brew install sshfs
sshfs andromeda:/home/core ./remote -o auto_cache,reconnect,defer_permissions,noappledouble
```

## Terraform + Digital Ocean

[mozilla/sops: Simple and flexible tool for managing secrets](https://github.com/mozilla/sops#test-with-the-dev-pgp-key)

``` bash
keybase pgp list | grep 'PGP Fingerprint' |  awk -F ": " '{print $NF}'
```

`.envrc` `SOPS_PGP_FP`



ssh root@206.189.35.8

adduser team7 --disabled-password --quiet  --gecos ""
usermod -aG sudo team7
mkdir -p /home/team7/.ssh
chown 700 /home/team7/.ssh
cp ~/.ssh/authorized_keys /home/team7/.ssh/authorized_keys
chown -R team7 /home/team7/.ssh

sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
systemctl restart sshd


ssh team7@206.189.35.8







sshfs andromeda:/home/core ./remote-src/ -o auto_cache,reconnect,defer_permissions,noappledouble

sshfs team7@206.189.35.8:/home/team7 ./remote-dst/ -o auto_cache,reconnect,defer_permissions,noappledouble
