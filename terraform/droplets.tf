data "digitalocean_ssh_key" "team7" {
  name = "team7"
}

data "digitalocean_images" "debian_latest" {
  filter {
    key = "distribution"
    values = ["Debian"]
  }

  filter {
    key = "regions"
    values = [ var.default_region ]
  }

  filter {
    key = "private"
    values = [ true ]
  }

  filter {
    key = "status"
    values = [ "available" ]
  }

  sort {
    key = "name"
    direction = "desc"
  }
}

data "digitalocean_sizes" "main" {
  filter {
    key    = "vcpus"
    values = [1, 2]
  }

  filter {
    key    = "regions"
    values = [ var.default_region ]
  }

  sort {
    key       = "price_monthly"
    direction = "asc"
  }
}

resource "digitalocean_droplet" "vpn" {
  image    = data.digitalocean_images.debian_latest.images.0.id
  name     = "vpn"
  region   = var.default_region
  size     = element(data.digitalocean_sizes.main.sizes, 0).slug

  backups  = false
  monitoring = true
  ipv6     = false
  private_networking = false

  ssh_keys = [
    data.digitalocean_ssh_key.team7.id
    ]

  tags     = [
    digitalocean_tag.default.name
    ]
}
