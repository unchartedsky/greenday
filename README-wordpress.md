# Wordpress

> Note that, when setting `WORDPRESS_SKIP_INSTALL` to `yes`, the values `WORDPRESS_USERNAME`, `WORDPRESS_PASSWORD`, `WORDPRESS_BLOG_NAME`, `WORDPRESS_EMAIL`, `WORDPRESS_BLOG_NAME` and `WORDPRESS_SMTP_*` variables will be ignored. Make sure that, in this imported database, the table prefix matches the one set in `WORDPRESS_TABLE_PREFIX`.
>
> Ref: [bitnami/bitnami-docker-wordpress: Bitnami Docker Image for WordPress](https://github.com/bitnami/bitnami-docker-wordpress)

## 관리자 대시보드

관리자 대시보드 `/wp-admin` 은 허용한 IP 대역에서만 접속가능합니다. `wordpress.enc.yaml` 파일을 복호화하면 IP 대역을 알 수 있습니다.이 주소만 알면 어디에서나 대시보드에 접속가능합니다. 방법은 다음과 같습니다.

1. 헤더 값을 바꾸는 웹 브라우저 플러그인을 설치합니다. Firefox의 경우 [X-Forwarded-For Header](https://addons.mozilla.org/en-US/firefox/addon/x-forwarded-for-injector) 애드온이면 충분합니다.
2. 방금 설치한 확장기능을 이용해 `x-forwarded-for` 헤더 값을 조작합니다. 앞서 알아낸 IP 주소 중 하나를 적어 넣으면 됩니다.
  ![](docs/images/X-Forwarded-For.png)


## New Relic PHP Agent

워드프레스의 성능을 개선하는데 New Relic이 도움이 됐다. 하지만 무료 버전은 매우 기능이 제한적이다. 그런데다 리소스를 아껴써야 하는 환경에서는 에이전트의 메모리 사용량도 눈에 거슬린다.

![](docs/images/newrelic.png)

## 할 일

- [x] [워드프레스 uploads 폴더를 aws S3으로](https://eastsocial.co.kr/archives/5521)

## 참고

- [Wordpress 어떻게 관리할 것인가 » 안드로메다 토끼](https://andromedarabbit.net/wordpress-%ec%96%b4%eb%96%bb%ea%b2%8c-%ea%b4%80%eb%a6%ac%ed%95%a0-%ea%b2%83%ec%9d%b8%ea%b0%80/)
