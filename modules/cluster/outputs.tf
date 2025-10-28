output "kube_host" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.host
}

output "kube_client_certificate" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.client_certificate
}

output "kube_client_key" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.client_key
}

output "kube_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate
}
