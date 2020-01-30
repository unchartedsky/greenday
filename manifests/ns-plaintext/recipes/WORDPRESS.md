# Wordpress

> Note that, when setting `WORDPRESS_SKIP_INSTALL` to `yes`, the values `WORDPRESS_USERNAME`, `WORDPRESS_PASSWORD`, `WORDPRESS_BLOG_NAME`, `WORDPRESS_EMAIL`, `WORDPRESS_BLOG_NAME` and `WORDPRESS_SMTP_*` variables will be ignored. Make sure that, in this imported database, the table prefix matches the one set in `WORDPRESS_TABLE_PREFIX`.
>
> Ref: [bitnami/bitnami-docker-wordpress: Bitnami Docker Image for WordPress](https://github.com/bitnami/bitnami-docker-wordpress)

## New Relic PHP Agent

워드프레스의 성능을 개선하는데 New Relic이 도움이 됐다. 하지만 무료 버전은 매우 기능이 제한적이다. 그런데다 리소스를 아껴써야 하는 환경에서는 에이전트의 메모리 사용량도 눈에 거슬린다.

![](docs/images/newrelic.png)

## TODO

- [ ] [워드프레스 uploads 폴더를 aws S3으로](https://eastsocial.co.kr/archives/5521)
