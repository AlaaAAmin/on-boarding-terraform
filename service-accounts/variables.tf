variable "project-id" {
  type = string
}

variable "svc-accounts-names" {
  type = list(object({
    id   = string
    name = string
  }))
}
