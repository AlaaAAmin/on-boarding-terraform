variable "cluster-net" {
  type = string
}

variable "cluster-sub-network" {
  type = object({
    name = string
    cidr = string
  })
}
variable "cluster" {
  type = object({
    name              = string
    master-plane-cidr = string
    location          = string
    node-locations    = list(string)
    cluster-cidr      = string
    services-cidr     = string
  })
}

variable "node-pool" {
  type = object({
    name           = string
    machine-type   = string
    node-locations = list(string)
  })
}

variable "k8s-sa" {
  type = string
}
