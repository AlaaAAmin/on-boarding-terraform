resource "google_compute_network" "playground-vpc" {
  project                         = var.project_id
  name                            = var.vpc_name
  auto_create_subnetworks         = false
  description                     = "playground vpc for trying awesome things"
  delete_default_routes_on_create = false
}
