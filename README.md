
# Wordpress 예제

## 준비물

`direnv`

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