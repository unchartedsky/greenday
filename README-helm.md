# Howto

``` bash
helm fetch \
  --repo https://kubernetes-charts.storage.googleapis.com \
  --untar \
  --untardir ./charts \
    wordpress

helm template \
  --name-template team7 \
  --namespace wordpress \
  --values ./values/wordpress.yaml \
    ./charts/wordpress

kubectl apply --recursive --filename ./manifests/
wordpress
```

# Ref

* [Using Helm without Tiller - Giant Swarm](https://blog.giantswarm.io/what-you-yaml-is-what-you-get/)
