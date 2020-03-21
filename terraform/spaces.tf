resource "digitalocean_spaces_bucket" "default" {
  name   = "team7"
  region = var.default_region

  force_destroy = true
}

# resource "digitalocean_cdn" "default" {
#   origin = digitalocean_spaces_bucket.default.bucket_domain_name
#   ttl    = 3600
# }
