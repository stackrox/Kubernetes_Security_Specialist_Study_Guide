
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.45.0"
    }
  }

  required_version = ">= 0.13"
}

provider "google" {
  project     = var.project_id
  credentials = file("${path.module}/files/auth.json")
  region      = var.region
  zone        = var.zone
}
