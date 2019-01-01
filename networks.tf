# main
# provider docker {}

resource "docker_network" "monitoring" {
  name   = "monitoring"
  driver = "bridge"
}
