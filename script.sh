#!/bin/bash
# Description: Publish app php on Kubernets

echo "Criando as imagens..."
docker build -t sandrowp/proj01-backend:1.0 backend/.
docker build -t sandrowp/proj01-dabase:1.0 database/.

echo "Publicando as imagens no dockerhub..."
docker push sandrowp/proj01-backend:1.0
docker push sandrowp/proj01-dabase:1.0

echo "Criando serviços do cluster Kubernetes..."
kubectl apply -f ./services.yml

echo "Realizando os deployments..."
kubectl apply -f ./deployment.yml
