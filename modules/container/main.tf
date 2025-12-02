# NOTE: The 'terraform' and 'provider' blocks are removed from here.
# 1. Root Terraform Block: Define providers and the backend (if needed)
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

resource "docker_image" "generic_image" {
  name         = var.image_name
  keep_locally = true
}

resource "docker_container" "generic_container" {
  name  = var.container_name
  image = docker_image.generic_image.image_id

  ports {
    internal = 80
    external = var.external_port
  }
}