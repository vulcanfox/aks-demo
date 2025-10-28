variable "generic_name" {
  description = "Name to use for resources."
  type        = string
  default     = "adnan-demo"
}

variable "appId" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}

variable "namespace" {
  description = "Name to use for namespace."
  type        = string
  default     = "adnan-demo-namespace"
}
