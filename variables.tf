variable "project_id" {
  type = string
}
variable "region" {
  type        = string
  description = "project resion"
}
variable "vpc_name" {
  type = string
}

variable "playground-subnet" {
  type = object({
    region = string
    cidr   = string
  })
}

#service account
# variable "sa_id" {
#   type = string
# }
# variable "sa_Dname" {
#   type = string
# }

variable "svc-accounts-names" {
  type = list(object({
    id   = string
    name = string
  }))
}

#cluster
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

#cluster node pool
variable "node-pool" {
  type = object({
    name           = string
    machine-type   = string
    node-locations = list(string)
  })
}

variable "buckets" {
  type = list(object({
    name = string
  }))
}

variable "datasets" {
  type = list(object({
    name = string
  }))
}

variable "vm-instance" {
  type = object({
    name     = string
    type     = string
    os-image = string
    zone     = string
    net-tag  = string
  })
}
