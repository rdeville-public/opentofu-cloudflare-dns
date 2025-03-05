# Configure the Github Provider
terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~>5.0"
    }
  }
}
