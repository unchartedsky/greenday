data "digitalocean_kubernetes_versions" "team7" {

}

resource "digitalocean_kubernetes_cluster" "team7" {
  name    = "team7"
  region  = "sgp1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = data.digitalocean_kubernetes_versions.team7.latest_version
  tags    = [ digitalocean_tag.default.name ]

  node_pool {
    name       = "nodes"
    size       = "s-4vcpu-8gb"
    node_count = 1
    tags    = [ digitalocean_tag.default.name ]
  }
}
