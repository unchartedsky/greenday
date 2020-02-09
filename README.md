
![](https://github.com/unchartedsky/greenday/workflows/packer/badge.svg)
![](https://github.com/unchartedsky/greenday/workflows/wp-cron/badge.svg)

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

## 편집기

[Visual Studio Code](https://code.visualstudio.com/)를 설치하고 이 프로젝트 폴더를 열면 미리 준비한 [User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings) 값에 따라 최적의 구성을 유도합니다.

## 설치

설치 스크립트 `install.sh`를 실행합니다. 일반적인 경우에 단 한번만 실행하면 됩니다.

``` bash
./install.sh
```

## Secret 암호화

[mozilla/sops: Simple and flexible tool for managing secrets](https://github.com/mozilla/sops#test-with-the-dev-pgp-key)

``` bash
keybase pgp list | grep 'PGP Fingerprint' |  awk -F ": " '{print $NF}'
```

`.envrc` `SOPS_PGP_FP`


## GPG password 문제

**make decrypt시 발생 가능한 문제**
- .gnupg 에 key 가 없다고 나온다면
```
keybase pgp export -q <KEY_ID> --secret | gpg --import --allow-secret-key-import
gpg --export-secret-keys > secring.gpg
```

- passphrase문제로 decrypt가 안된다면 
```
echo "MY_GPG_PASSPHRASE" > key.txt
touch dummy.txt
gpg --batch --yes --passphrase-file key.txt --pinentry-mode=loopback -s dummy.txt # sign dummy file to unlock agent
```

