# Strongswan Ikev2 VPN Server

Ikev2는 Port 500과 4500을 사용하며 포트를 바꿀 수는 없다. 하여 nginx udp 로드밸런서를 앞에 두고 Strongswan의 NodePort와 연결하려 했으나 잘 되지 않는다. 인증은 성공하나 아래와 같은 오류가 발생하고 VPN 연결은 작동하지 않는다.

```
06[KNL] NAT mappings of ESP CHILD_SA with SPI cd0425f3 and reqid {9} changed, queuing update job
11[KNL] NAT mappings of ESP CHILD_SA with SPI cd0425f3 and reqid {9} changed, queuing update job
```

이 문제를 해결하더라도 VPN 서버가 복수 개인 경우에 nginx로는 로드밸런싱을 제대로 못한다는 지적도 있다. [[strongSwan] Can StrongSwan be loadbalanced? - Google Groups](https://groups.google.com/forum/#!msg/strongswan-users/3_gOzkxxiZ0/qtrBw_fHCQAJ)의 대화를 참고하자.

KEMP 로드밸런서 등을 이용하면 문제를 해결할 수 있다. [Always On VPN IKEv2 Load Balancing with KEMP LoadMaster | Richard M. Hicks Consulting, Inc.](https://directaccess.richardhicks.com/2018/09/17/always-on-vpn-ikev2-load-balancing-with-kemp-loadmaster/)를 참고하자.
