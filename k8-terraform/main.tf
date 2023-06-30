terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  host = "tcp://localhost:2375"  # Docker Desktop API endpoint
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = "my-nginx"
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8081
  }
}
