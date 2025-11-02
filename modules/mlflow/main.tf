resource "helm_release" "mlflow" {
  name             = "mlflow"
  repository       = "https://community-charts.github.io/helm-charts"
  chart            = "mlflow"
  namespace        = var.namespace
  create_namespace = true
  version          = "1.7.3"
  timeout          = 900
  wait             = true

  values = [
    yamlencode({
      replicaCount = 3
      service = {
        type = "LoadBalancer"
      }

      extraEnvVars = {
        # just for testing
        MLFLOW_SERVER_CORS_ALLOWED_ORIGINS = "*"
        # just for testing
        MLFLOW_SERVER_ALLOWED_HOSTS = "*"
      }
    })
  ]
}
