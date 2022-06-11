provider "google" {
  project     = "Terraform-GCP"
  region      = "us-central1"
  credentials = file("serviceaccount.json")
}
