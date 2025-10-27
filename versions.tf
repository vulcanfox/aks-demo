terraform {
  required_providers {
    # Azure provider
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.9"
    }
    # Kubernetes provider
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  required_version = ">= 0.14"
}

