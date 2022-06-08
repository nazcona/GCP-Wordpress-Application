resource "google_compute_network" "vpc_network" {
  project                 = google_project.gcp-project.project_id
  name                    = "VPC"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}