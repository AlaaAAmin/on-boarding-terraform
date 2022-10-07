resource "google_compute_instance" "test-vm" {
  name         = var.vm-instance.name
  machine_type = var.vm-instance.type
  zone         = var.vm-instance.zone

  tags = [var.vm-instance.net-tag]

  boot_disk {
    initialize_params {
      # cmd => `gcloud compute images list | grep ubuntu` 
      # TO list all available images.  
      image = var.vm-instance.os-image
      size  = 10
      type  = "pd-standard" # disk type
    }
  }

  network_interface {
    network    = var.network.vpc
    subnetwork = var.network.subnet
  }

  #   metadata_startup_script = file("startup_script.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.svc-accounts[0]
    scopes = ["cloud-platform"]
  }
}
