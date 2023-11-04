# Variables
variable "destroy" {
  type    = bool
  default = false
}

variable "key_arn" {
  type    = string
  default = null
}

variable "key_config" {
  type = object({
    delete_days  = optional(number)
    description  = optional(string)
    enable       = optional(bool)
    key_spec     = optional(string)
    multi_region = optional(bool)
    rotation     = optional(bool)
    usage        = optional(string)
  })
  default = null
}

variable "name" {
  type = string
}

variable "protection_policy" {
  type = object({
    credentials           = optional(bool)
    device_identifiers    = optional(bool)
    financial_information = optional(bool)
    phi                   = optional(bool)
    pii                   = optional(bool)
  })
  default = {
    credentials           = true
    device_identifiers    = true
    financial_information = true
    phi                   = true
    pii                   = true
  }
}

variable "retention_days" {
  type    = number
  default = null
}
