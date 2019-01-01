# main

### grafana
resource "docker_image" "grafana" {
  name         = "grafana/grafana:5.4.2"
  keep_locally = true
}

resource "docker_container" "grafana" {
  name     = "grafana"
  image    = "${docker_image.grafana.latest}"
  hostname = "grafana"

  env = [
    "GF_SECURITY_ADMIN_PASSWORD=secret",
    "GF_AUTH_ANONYMOUS_ENABLED=true",
  ]

  publish_all_ports = false

  ports {
    internal = 3000
    external = 3000
  }

  volumes {
    host_path      = "${path.cwd}/grafana/provisioning/"
    container_path = "/etc/grafana/provisioning/"
  }

  networks_advanced {
    name = "${docker_network.monitoring.name}"
  }
}
