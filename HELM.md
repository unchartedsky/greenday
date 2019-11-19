# Howto

``` bash
helm pull \
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
