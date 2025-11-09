terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

data "google_client_config" "current" {}

resource "random_id" "suffix" {
  byte_length = 4
}

# Test resource: a small GCS bucket. This verifies the SA can create resources.
resource "google_storage_bucket" "test_bucket" {
  name     = "tf-test-${random_id.suffix.hex}"
  location = var.region

  # lightweight safety flags - remove or change for production
  uniform_bucket_level_access = true
  force_destroy               = true
}

output "test_bucket_name" {
  value = google_storage_bucket.test_bucket.name
}
