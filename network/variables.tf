/*----------- project ------------*/
variable "project_id" {
  type = string
}
variable "region" {
  type        = string
  description = "the default region for the project"
}

/*----------- vpc ------------*/
variable "vpc_name" {
  type    = string
  default = "terraform-vpc"
}

/*----------- subnet ------------*/
# variable "playground_subnet_region" {
#   type = string
# }
# variable "playground_subnet_CIDR" {
#   type = string
# }
variable "playground-subnet" {
  type = object({
    region = string
    cidr   = string
  })
}
