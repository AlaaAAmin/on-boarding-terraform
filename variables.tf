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

#sercvice account
variable "sa_id" {
  type = string
}
variable "sa_Dname" {
  type = string
}
