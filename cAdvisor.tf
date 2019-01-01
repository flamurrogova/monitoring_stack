# main

### cAdvisor
resource "docker_image" "cAdvisor" {
  name         = "google/cadvisor:v0.32.0"
  keep_locally = true
}

resource "docker_container" "cAdvisor" {
  name     = "cAdvisor"
  image    = "${docker_image.cAdvisor.latest}"
  hostname = "cAdvisor"

  volumes {
    host_path      = "/"
    container_path = "/rootfs"
    read_only      = true
  }

  volumes {
    host_path      = "/var/run"
    container_path = "/var/run"
    read_only      = true
  }

  volumes {
    host_path      = "/sys"
    container_path = "/sys"
    read_only      = true
  }

  volumes {
    host_path      = "/"
    container_path = "/rootfs"
    read_only      = true
  }

  volumes {
    host_path      = "/var/lib/docker"
    container_path = "/var/lib/docker"
    read_only      = true
  }

  volumes {
    host_path      = "/dev/disk"
    container_path = "/dev/disk"
    read_only      = true
  }

  networks_advanced {
    name = "${docker_network.monitoring.name}"
  }
}
