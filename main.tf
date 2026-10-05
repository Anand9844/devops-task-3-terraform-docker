terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {}

# Pull the Nginx image from Docker Hub.
resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

# Provision a local Docker container using Terraform.
resource "docker_container" "nginx" {
  name  = "terraform-nginx-container"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8085
  }
}

output "container_name" {
  description = "Name of the Docker container created by Terraform"
  value       = docker_container.nginx.name
}

output "container_id" {
  description = "Docker container ID"
  value       = docker_container.nginx.id
}

output "application_url" {
  description = "URL to verify the running Nginx container"
  value       = "http://localhost:8085"
}
