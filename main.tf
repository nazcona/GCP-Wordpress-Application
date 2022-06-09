data "google_billing_account" "acct" {
  display_name = var.billing_acct
  open         = true
}

resource "random_password" "password" {
  length  = 16
  number  = false
  special = false
  lower   = true
  upper   = false
}

resource "google_project" "gcp-project" {
  name            = var.project_name
  project_id      = random_password.password.result
  billing_account = data.google_billing_account.acct.id
}

resource "null_resource" "set-project" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "gcloud config set project ${google_project.gcp-project.project_id}"
  }
}

resource "null_resource" "unset-project" {
  provisioner "local-exec" {
    when    = destroy
    command = "gcloud config unset project"
  }
}

resource "null_resource" "enable-apis" {
  depends_on = [
    google_project.gcp-project,
    null_resource.set-project
  ]
  triggers = {
    always_run = "${timestamp()}" 
  }

  provisioner "local-exec" {
    command = <<-EOT
        gcloud services enable compute.googleapis.com
        gcloud services enable dns.googleapis.com
        gcloud services enable storage-api.googleapis.com
        gcloud services enable container.googleapis.com
    EOT
  }
}

resource "google_compute_subnetwork" "public1" {
  name          = "public1"
  ip_cidr_range = var.public1_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "public2" {
  name          = "public2"
  ip_cidr_range = var.public2_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "public3" {
  name          = "public3"
  ip_cidr_range = var.public3_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private1" {
  name          = "private1"
  ip_cidr_range = var.private1_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private2" {
  name          = "private2"
  ip_cidr_range = var.private2_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private" {
  name          = "private3"
  ip_cidr_range = var.private3_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_network" "vpc_network" {
  project                 = google_project.gcp-project.project_id
  name                    = "VPC"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

#Cloud Router
resource "google_compute_router" "router" {
  name                          = "router"
  network                       = google_compute_network.vpc_network.id
  encrypted_interconnect_router = true
  bgp {
    asn = 64514
  }
}

#NAT

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNET_WORKS"

  subnetwork {
    name = "private1"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

#Firewall
resource "google_compute_firewall" "allow_http" {
  name    = var.firewall_name
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80","443", "22", "3306"]
  }
}

