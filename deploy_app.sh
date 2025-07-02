# scripts/deploy_app.sh
deploy_app() {
  kubectl apply -f manifests/deployment.yaml
}

deploy_keda_scaler() {
  kubectl apply -f manifests/scaledobject.yaml
}