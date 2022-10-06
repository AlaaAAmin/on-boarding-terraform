module "network" {
  source = "./network"

  project_id = var.project_id
  region     = var.region
  vpc_name   = var.vpc_name

  playground-subnet = var.playground-subnet
}

module "service-accounts" {
  source = "./service-accounts"

  project-id = var.project_id
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
  k8s-sa    = module.service-accounts.kubernetes-sa.email
}
