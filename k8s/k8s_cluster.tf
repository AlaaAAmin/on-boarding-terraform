resource "google_container_cluster" "playground-k8s" {
  name           = var.cluster.name
  location       = var.cluster.location # Zonal Cluster
  node_locations = var.cluster.node-locations

  # Terraform:
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.cluster-net
  subnetwork               = var.cluster-sub-network.name
  cluster_autoscaling {
    enabled = false
  }

  addons_config {
    http_load_balancing {
      disabled = false # enable only if you using custom ingress controller
    }
  }
  # update GKE Cluster only if there's stable updaete
  release_channel {
    channel = "STABLE"
  }

  private_cluster_config {
    # creating a private endpoints on the cluster.
    enable_private_nodes = true
    # to only connext to k8s from private endpoint ex: bastion server
    enable_private_endpoint = true
    # cidr will be assigned to the master (control plane) control plane
    master_ipv4_cidr_block = var.cluster.master-plane-cidr
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "35.235.240.0/20" #restricting access to IAP

      display_name = "playground-subnet-acces-only"
    }
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.cluster.cluster-cidr
    services_ipv4_cidr_block = var.cluster.services-cidr
  }
}

resource "google_container_node_pool" "playground-k8s-nodes" {
  name = var.node-pool.name
  #location   = "europe-west2-a"
  node_locations = var.node-pool.node-locations
  cluster        = google_container_cluster.playground-k8s.name
  node_count     = 2

  node_config {
    preemptible  = false # if enabled: type of vms that last up to 24 hours after creation.
    machine_type = var.node-pool.machine-type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.k8s-sa
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
