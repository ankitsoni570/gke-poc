#!/bin/bash

#Get the cluster access
gcloud container clusters get-credentials ankit-gcp-poc --region us-central1 --project infosys-gcp-demo-project

#Deploy and expose the application
kubectl create -f deployment.yaml
kubectl create -f service.yaml
kubectl get deploy
kubectl get svc
