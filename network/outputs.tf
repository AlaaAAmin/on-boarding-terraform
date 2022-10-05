output "vpc_id" {
  value = google_compute_network.playground-vpc.id
}
output "vpc_name" {
  value = google_compute_network.playground-vpc.name
}
output "playground_subnet_name" {
  value = google_compute_subnetwork.playground-subnet.name
}
output "playground_subnet_id" {
  value = google_compute_subnetwork.playground-subnet.id
}
