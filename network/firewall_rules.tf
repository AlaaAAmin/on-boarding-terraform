resource "google_compute_firewall" "ssh-rule" {
  project   = var.project_id
  name      = "allow-ssh-traffic"
  network   = google_compute_network.playground-vpc.name
  direction = "INGRESS" # Inbound traffic
  priority  = "1000"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"] # restricting access to IAP
  target_tags   = ["test-vm"]
}
