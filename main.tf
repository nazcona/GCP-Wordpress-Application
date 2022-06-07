resource "google_compute_network" "vpc_network" {
  project                 = var.project
  name                    = var.name
  auto_create_subnetworks = true
  routing_mode            = "GLOBAL"
}