terraform {
  backend "gcs" {
    bucket = "terraform-gcp-project"
    prefix = "terraform/state"
  }
}