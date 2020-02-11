
# DigitalOcean Droplet

``` bash
ssh root@206.189.35.8

adduser team7 --disabled-password --quiet --gecos ""
usermod -aG sudo team7
mkdir -p /home/team7/.ssh
chown 700 /home/team7/.ssh
cp ~/.ssh/authorized_keys /home/team7/.ssh/authorized_keys
chown -R team7 /home/team7/.ssh

sed -i '/^PermitRootLogin/s/yes/no/' /etc/ssh/sshd_config
systemctl restart sshd

ssh team7@206.189.35.8
```


## `sshfs` 사용 예제

``` bash
sshfs andromeda:/home/core ./remote-src/ -o auto_cache,reconnect,defer_permissions,noappledouble

sshfs team7@206.189.35.8:/home/team7 ./remote-dst/ -o auto_cache,reconnect,defer_permissions,noappledouble
```
