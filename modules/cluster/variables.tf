variable "generic_name" {
  description = "Name to use for resources."
  type        = string
}

variable "appId" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}


