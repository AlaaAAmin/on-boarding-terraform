variable "buckets" {
  type = list(object({
    name = string
  }))
}

variable "location" {
  type = string
}
