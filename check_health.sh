# scripts/check_health.sh
check_deployment_health() {
  kubectl get deployment "$1" -n $NAMESPACE
  kubectl get pods -l app="$1" -n $NAMESPACE
}