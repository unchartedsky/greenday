# Wireguard

``` bash
wg-quick up .secrets/wg0.conf
wg-quick down .secrets/wg0.conf
```

``` bash
qrencode -o wg0.png  < .secrets/wg0.conf
```

## 참고

- [masipcat/wireguard-go-docker](https://github.com/masipcat/wireguard-go-docker)
- [algo/client-macos-wireguard.md at master · trailofbits/algo](https://github.com/trailofbits/algo/blob/master/docs/client-macos-wireguard.md)
