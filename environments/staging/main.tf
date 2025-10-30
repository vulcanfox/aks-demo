terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.32"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "3355c44e-16b5-4516-8100-b78b686c8c31"
}

provider "kubernetes" {
  host                   = module.cluster.kube_host
  client_certificate     = base64decode(module.cluster.kube_client_certificate)
  client_key             = base64decode(module.cluster.kube_client_key)
  cluster_ca_certificate = base64decode(module.cluster.kube_cluster_ca_certificate)
}


provider "helm" {
  kubernetes = {
    host                   = module.cluster.kube_host
    client_certificate     = base64decode(module.cluster.kube_client_certificate)
    client_key             = base64decode(module.cluster.kube_client_key)
    cluster_ca_certificate = base64decode(module.cluster.kube_cluster_ca_certificate)
  }
}

module "cluster" {
  source       = "../../modules/cluster"
  appId        = var.appId    # Pass root var to module
  password     = var.password # Pass root var to module...
  generic_name = var.generic_name
  environment  = var.environment
}

module "mlflow" {
  source     = "../../modules/mlflow"
  namespace  = var.namespace
  depends_on = [module.cluster]
}
