# main

### prometheus
resource "docker_image" "prometheus" {
  name         = "prom/prometheus:v2.6.0"
  keep_locally = true
}

resource "docker_container" "prometheus" {
  name     = "prometheus"
  image    = "${docker_image.prometheus.latest}"
  hostname = "prometheus"

  volumes {
    host_path      = "${path.cwd}/prometheus/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }

  networks_advanced {
    name = "${docker_network.monitoring.name}"
  }
}
