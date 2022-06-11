resource "google_compute_forwarding_rule" "default" {
  name                  = "website-forwarding-rule"
  region                = var.asg_config["region"]
  port_range            = 80
  backend_service       = google_compute_region_backend_service.backend.id
}
resource "google_compute_region_backend_service" "backend" {
  name                  = "website-backend"
  region                = var.asg_config["region"]
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_region_health_check.hc.id]
}
resource "google_compute_region_health_check" "hc" {
  name               = "check-website-backend"
  check_interval_sec = 1
  timeout_sec        = 1
  region             = var.asg_config["region"]

  tcp_health_check {
    port = "80"
  }
}