variable "vm-instance" {
  type = object({
    name     = string
    type     = string
    os-image = string
    zone     = string
    net-tag  = string
  })
}

variable "network" {
  type = object({
    vpc    = string
    subnet = string
  })
}
