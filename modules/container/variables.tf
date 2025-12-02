variable "container_name" {
  description = "The name for the container."
  type        = string
}

variable "external_port" {
  description = "The host port to expose the service on."
  type        = number
}

variable "image_name" {
  description = "The name and tag of the Docker image to pull (e.g., nginx:latest)."
  type        = string
}