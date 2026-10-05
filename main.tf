terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull the image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Create the container (depends on the image implicitly)
resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8082
  }
}
