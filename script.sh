#!/bin/bash

#Get the cluster access
gcloud container clusters get-credentials ankit-gcp-poc --region us-central1 --project concrete-crow-244606

#Deploy and expose the application
kubectl create -f deployment.yaml
kubectl create -f service.yaml
kubectl get deploy
kubectl get svc
