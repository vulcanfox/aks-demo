
variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "generic_name" {
  default     = "adnan-aks-demo"
  description = "The generic name to use for the project such as for resource group or resource name."
}

variable "kubernetes_version" {
  default     = "1.26.3"
  description = "The kubernetes version to use."
}
