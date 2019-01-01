# main

### alertmanger
resource "docker_image" "alertmanager" {
  name         = "prom/alertmanager:v0.15.3"
  keep_locally = true
}

resource "docker_container" "alertmanager" {
  name     = "alertmanager"
  hostname = "alertmanager"

  networks_advanced {
    name = "${docker_network.monitoring.name}"
  }

  image = "${docker_image.alertmanager.latest}"
}
