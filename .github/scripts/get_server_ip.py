import subprocess
import os
import time
import sys

# Config
NAMESPACE = os.environ.get("MLFLOW_NAMESPACE", "mlflow")
SERVICE_NAME = os.environ.get("MLFLOW_SERVICE_NAME", "mlflow")

EXTERNAL_IP = None
MAX_RETRIES = 30
SLEEP_SECONDS = 10

print("Waiting for MLflow external IP...")

for i in range(MAX_RETRIES):
    try:
        output = subprocess.check_output([
            "kubectl", "get", "svc", SERVICE_NAME,
            "-n", NAMESPACE,
            "-o", "jsonpath={.status.loadBalancer.ingress[0].ip}"
        ])
        EXTERNAL_IP = output.decode().strip()
        if EXTERNAL_IP:
            print(f"MLflow external IP: {EXTERNAL_IP}")
            break
    except subprocess.CalledProcessError:
        pass

    print(f"External IP not assigned yet. Retry {i+1}/{MAX_RETRIES} in {SLEEP_SECONDS}s...")
    time.sleep(SLEEP_SECONDS)

if not EXTERNAL_IP:
    print("Failed to get MLflow external IP.", file=sys.stderr)
    sys.exit(1)

# Export for GitHub Actions
print(f"MLFLOW_EXTERNAL_IP={EXTERNAL_IP}")
with open(os.environ['GITHUB_ENV'], 'a') as f:
    f.write(f"MLFLOW_EXTERNAL_IP={EXTERNAL_IP}\n")
