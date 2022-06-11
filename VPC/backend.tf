terraform {
  backend "gcs" {
    bucket = "change me"
    prefix = "terraform/state"
  }
}