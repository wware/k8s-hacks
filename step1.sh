#!/bin/bash -xe

export TF_VAR_db_password="MyDumbPassword12345"

# Configure kubectl to connect to the EKS cluster
export CLUSTER_NAME=$(grep -C 4 cluster_name infra/variables.tf | grep default | grep -v 'us-east' | \
                      sed 's/.*= //' | sed 's/"//g')
echo "CLUSTER_NAME = $CLUSTER_NAME"
aws eks update-kubeconfig --name $CLUSTER_NAME

# Build and push the Docker image to ECR
export ECR_REPO_URI=$(aws ecr describe-repositories --repository-names bookreview-api \
                      --query 'repositories[0].repositoryUri' --output text)
echo "ECR_REPO_URI = $ECR_REPO_URI"
docker build -t $ECR_REPO_URI:latest .
aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_REPO_URI
docker push $ECR_REPO_URI:latest

# Deploy the application to EKS, Check that the pods are running
kubectl apply -f k8s-manifests.yaml
kubectl get pods
