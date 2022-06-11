provider "google" {
  credentials = file("serviceaccount.json")
  project     = "Terraform-GCP"
  region      = "us-central1"
}