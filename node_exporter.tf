# main

### node explorer
resource "docker_image" "node_exporter" {
  name         = "prom/node-exporter:v0.17.0"
  keep_locally = true
}

resource "docker_container" "node_exporter" {
  image    = "${docker_image.node_exporter.latest}"
  name     = "node_exporter"
  hostname = "node_exporter"

  networks_advanced {
    name = "${docker_network.monitoring.name}"
  }
}
