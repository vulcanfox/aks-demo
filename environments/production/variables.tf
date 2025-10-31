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

variable "namespace" {
  description = "Name to use for namespace."
  type        = string
  default     = "adnan-demo-namespace"
}
variable "environment" {
  description = "Name to use for the environment.."
  type        = string
  default     = "prod"
}
