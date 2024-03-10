variable "node_count" {
  type    = number
  default = 3
}

resource  "google_compute_instance" "app-server" {
   count        = var.node_count
  name         = "appserv-${count.index}" 
   machine_type = "e2-micro"
   zone = "us-central1-a"
    boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20240307"
      type  = "pd-standard"
      size = 10
      labels = {
        my_label = "value"
      }
    }
    }
   network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
  metadata_startup_script = "echo hi > /test.txt"
  #allow_stopping_for_update = true
  service_account {
    email  = "235489968095-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

}








