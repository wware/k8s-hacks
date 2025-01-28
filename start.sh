#!/bin/bash -xe

echo "🔄 Starting Minikube..."
minikube start || minikube start --driver=docker --force --validate=false

echo "🔄 Pointing shell to Minikube's Docker daemon..."
eval $(minikube docker-env)

echo "🏗️ Building Docker image..."
docker build -t book-review-api:latest .

echo "🧹 Cleaning up existing deployments..."
kubectl delete -f app.yaml --ignore-not-found
kubectl delete -f postgres.yaml --ignore-not-found
kubectl delete -f secret.yaml --ignore-not-found
kubectl delete -f configmap.yaml --ignore-not-found

echo "📦 Applying Kubernetes manifests..."
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml
kubectl apply -f postgres.yaml
kubectl apply -f app.yaml

echo "⏳ Waiting for PostgreSQL to be ready..."
kubectl wait --for=condition=ready pod -l app=postgres --timeout=120s

echo "⏳ Waiting for Book Review API to be ready..."
kubectl wait --for=condition=ready pod -l app=book-review-api --timeout=120s

echo "🚀 Opening service in browser..."
minikube service book-review-api

echo "'minikube delete' to blow it all away"
