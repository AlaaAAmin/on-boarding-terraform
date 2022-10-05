resource "google_compute_subnetwork" "playground-subnet" {
  name                     = "playground-subnet"
  ip_cidr_range            = var.playground-subnet.cidr
  region                   = var.playground-subnet.region
  network                  = google_compute_network.playground-vpc.id
  description              = "playground subnet for hosting our infrastructure"
  private_ip_google_access = true
}
