# Variables
variable "destroy" {
  type = bool
}

variable "name" {
  type = string
}

variable "retention_in_days" {
  type    = number
  default = null
}
