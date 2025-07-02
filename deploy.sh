# deploy.sh
#!/bin/bash

set -e
NAMESPACE="default"

source scripts/install_keda.sh
source scripts/deploy_app.sh
source scripts/check_health.sh

case "$1" in
  precheck)
    check_prerequisites
    ;;
  install-keda)
    install_keda
    ;;
  deploy-app)
    deploy_app
    ;;
  deploy-scaler)
    deploy_keda_scaler
    ;;
  check-health)
    check_deployment_health "$2"
    ;;
  all)
    check_prerequisites
    install_keda
    deploy_app
    deploy_keda_scaler
    ;;
  *)
    echo "Usage: $0 [precheck|install-keda|deploy-app|deploy-scaler|check-health <name>|all]"
    ;;