# Variables
variable "destroy" {
  type    = bool
  default = false
}

variable "name" {
  type = string
}

variable "retention_in_days" {
  type    = number
  default = null
}
