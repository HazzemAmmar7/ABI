terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.19.0"
    }
  }
}

provider "google" {
  project = "crc-gcp-415620"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "./crc-gcp-415620-73b35c431434.json"
}