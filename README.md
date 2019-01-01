# Prometheus/Grafana on docker

Terraforming simple monitoring stack on docker

This is simple monitoring stack based on
- Prometheus (https://prometheus.io/)
- Grafana (https://grafana.com/)

Grafana is auto provisioned with datasources and dashboards.

Additionally the following exporters are provided,
- cAdvisor (https://github.com/google/cadvisor) for container monitoring
- node exporter (https://github.com/prometheus/node_exporter) for host monitoring

To run this repo you need a docker host with Terraform binary (https://www.terraform.io/) installed.


