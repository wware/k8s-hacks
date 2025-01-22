#!/bin/bash -xe

# Switch to minikube's docker
eval $(minikube docker-env)

# Build new image
docker build -t bookreview-api:latest .

# Kill any previous deployment
kubectl delete -f deployment.yaml || true

# Deploy
kubectl apply -f configmap.yml
kubectl apply -f deployment.yaml
kubectl apply -f service.yml
