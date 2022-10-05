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
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["test-vm"]
}
