# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "uncharted"

    workspaces {
      name = "greenday"
    }
  }
}
