project_id = "versatile-bolt-354107"
region     = "us-central1"
vpc_name   = "plaground-vpc"
# sa_id      = "bastion-sa"
# sa_Dname   = "Bastion service account"

playground-subnet = {
  cidr   = "10.0.1.0/24"
  region = "us-central1"
}

cluster = {
  name              = "playground-k8s"
  master-plane-cidr = "172.16.0.0/28"
  cluster-cidr      = "192.168.0.0/16"
  location          = "us-central1-c"
  node-locations    = ["us-central1-c", "us-central1-f"]
  services-cidr     = "10.96.0.0/16"
}

node-pool = {
  name           = "playground-k8s-node-pool"
  machine-type   = "e2-standard-2"
  node-locations = ["us-central1-c", "us-central1-f"]
}
