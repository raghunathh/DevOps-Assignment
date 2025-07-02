# scripts/install_keda.sh
check_prerequisites() {
  for cmd in kubectl helm; do
    command -v $cmd &> /dev/null || { echo "$cmd not found"; exit 1; }
  done
}

install_keda() {
  helm repo add kedacore https://kedacore.github.io/charts
  helm repo update
  helm install keda kedacore/keda --namespace keda --create-namespace
  kubectl rollout status deployment/keda-operator -n keda
}