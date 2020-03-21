# Configure the DigitalOcean Provider
provider "digitalocean" {
}

resource "digitalocean_project" "uncharted" {
  name        = "Uncharted"
  description = "https://github.com/unchartedsky/greenday"
  purpose     = "Team7's workspace"
  environment = "Production"
  # resources   = [digitalocean_kubernetes_cluster.team7.id]
}

# resource "digitalocean_project_resources" "uncharted" {
#   project = digitalocean_project.uncharted.id
#   resources = [
#     digitalocean_kubernetes_cluster.team7.id
#   ]
# }

resource "digitalocean_tag" "default" {
  name = "default"
}

variable default_region {
  default = "sgp1"
}
