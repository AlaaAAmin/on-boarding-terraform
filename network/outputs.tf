output "vpc-id" {
  value = google_compute_network.playground-vpc.id
}
output "vpc-name" {
  value = google_compute_network.playground-vpc.name
}
output "playground-subnet" {
  value = google_compute_subnetwork.playground-subnet
}
