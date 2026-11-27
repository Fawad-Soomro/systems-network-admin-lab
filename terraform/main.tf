terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.7.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_iac" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "lab07_web" {
  name  = "terraform-nginx-lab07"
  image = docker_image.nginx_iac.image_id
  ports {
    internal = 80
    external = 8085
  }
}
