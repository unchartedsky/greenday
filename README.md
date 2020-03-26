
![](https://github.com/unchartedsky/greenday/workflows/packer/badge.svg)

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

## Windows 10 WSL 사용시 준비물

- [Homebrew](https://docs.brew.sh/Homebrew-on-Linux)
```
brew doctor 를 이용해 설정에 문제가 없는지 체크.
```
- keybase pgp export
```
keybase pgp pull 로 키를 받았다면 바로 앞 섹션의 make decrypt시 발생 가능한 문제에서 언급된 키 익스포트를 진행한다.
[Kleopatra(gpg4win)](https://gpg4win.org/download.html)를 설치하면 Windows에서 gpg 커맨드를 사용할 수 있다.
WSL에서는 Windows에 설치된 keybase나 gpg에 직접 액세스가 불가능(조금 이상하긴 하지만 Wine을 이용하면 가능할수도...) 하기 때문에 키를 파일로 저장한다.
cat keybase-pgp.txt | gpg --import --no-tty --batch --allow-secret-key-import

```
- WSL 소소한 튜닝
```
.bashrc
# Start at home directory
if [ -t 1 ]; then
  cd ~
fi

# Fix WSL permissions
umask 022

.bash_profile
GPG_TTY=$(tty)
export GPG_TTY
```
마지막으로 저장소의 이미지 파일을 위해 git lfs pull을 잊지 않도록 한다...
