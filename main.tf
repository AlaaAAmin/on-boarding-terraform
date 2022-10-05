module "network" {
  source = "./network"

  project_id = var.project_id
  region     = var.region
  vpc_name   = var.vpc_name

  playground-subnet = var.playground-subnet
}
