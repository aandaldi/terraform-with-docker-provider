# Main
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

# Provider
provider "docker" {}

# Variables and Count
variable "instance_count" {
  description = "The number of Nginx containers to deploy."
  type        = number
  default     = 3 # We'll deploy 3 instances
}

variable "start_port" {
  description = "The first host port to use. Subsequent instances will increment this."
  type        = number
  default     = 8080
}

# Call module with count
module "nginx_server" {
  # --- ADD THE COUNT ARGUMENT ---
  count = var.instance_count 
  # ------------------------------

  source = "./modules/container"

  container_name = "nginx-server-${count.index + 1}" 
  external_port  = var.start_port + count.index 
  image_name     = "nginx:latest"
}
