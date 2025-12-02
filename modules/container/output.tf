# modules/container/outputs.tf

output "container_id" {
  description = "The ID of the created container."
  # Reference the resource defined in the module's main.tf
  value       = docker_container.generic_container.id 
}

output "web_url" {
  description = "The URL to access the web server."
  # Reference the variable defined in the module's variables.tf
  value       = "http://localhost:${var.external_port}"
}