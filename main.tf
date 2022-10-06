module "network" {
  source = "./network"

  project_id = var.project_id
  region     = var.region
  vpc_name   = var.vpc_name

  playground-subnet = var.playground-subnet
}

module "k8s" {
  source = "./k8s"

  cluster-net = module.network.vpc-name
  cluster-sub-network = {
    cidr = module.network.playground-subnet.ip_cidr_range
    name = module.network.playground-subnet.name
  }
  cluster   = var.cluster
  node-pool = var.node-pool
  k8s-sa    = google_service_account.kubernetes_service_account.email
}
