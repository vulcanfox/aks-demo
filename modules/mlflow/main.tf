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
        # Allow the browser to call MLflow API
        MLFLOW_SERVER_CORS_ALLOWED_ORIGINS = "*" # for testing; prefer explicit origins...

        # Allow the Host header(s) you access MLflow with
        # Example: set to "mlflow.example.com,10.0.0.*,localhost:*"
        MLFLOW_SERVER_ALLOWED_HOSTS = "*" # change to your host(s) or use "*"
      }
    })
  ]
}
