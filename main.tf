data "google_billing_account" "acct" {
  display_name = "My Billing Account"
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
  name            = "gcp-project"
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
  ip_cidr_range = "10.0.1.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "public2" {
  name          = "public2"
  ip_cidr_range = "10.0.2.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "public3" {
  name          = "public3"
  ip_cidr_range = "10.0.3.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private1" {
  name          = "private1"
  ip_cidr_range = "10.0.101.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private2" {
  name          = "private2"
  ip_cidr_range = "10.0.102.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_subnetwork" "private" {
  name          = "private3"
  ip_cidr_range = "10.0.103.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
}

resource "google_compute_network" "vpc_network" {
  project                 = google_project.gcp-project.project_id
  name                    = "VPC"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

