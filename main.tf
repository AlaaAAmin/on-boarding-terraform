module "network" {
  source = "./network"

  project_id = var.project_id
  region     = var.region
  vpc_name   = var.vpc_name

  playground-subnet = var.playground-subnet
}

module "service-accounts" {
  source             = "./service-accounts"
  project-id         = var.project_id
  svc-accounts-names = var.svc-accounts-names
}

module "k8s" {
  source = "./k8s"

  cluster-net = module.network.vpc-name
  cluster-sub-network = {
    cidr = module.network.playground-subnet.ip_cidr_range
    name = module.network.playground-subnet.name
  }
  cluster           = var.cluster
  node-pool         = var.node-pool
  gcr-read-sa-email = module.service-accounts.svc-accounts[0].email
}

module "buckets" {
  source = "./buckets"

  buckets  = var.buckets
  location = module.network.playground-subnet.region
}

module "bigquery" {
  source = "./bigquery"

  datasets = var.datasets
  location = module.network.playground-subnet.region
}

module "compute-instance" {
  source = "./compute-instance"

  vm-instance = var.vm-instance
  network = {
    region = module.network.playground-subnet.region
    subnet = module.network.playground-subnet.name
    vpc    = module.network.vpc-name
  }
  svc-accounts = [module.service-accounts.svc-accounts[1].email, module.service-accounts.svc-accounts[2].email]
}
