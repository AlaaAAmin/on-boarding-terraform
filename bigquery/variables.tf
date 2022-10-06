variable "datasets" {
  type = list(object({
    name = string
  }))
}

variable "location" {
  type = string
}
