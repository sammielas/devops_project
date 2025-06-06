#!/bin/bash
echo "Starting Minikube with Docker driver and profile minikube-staging..."
minikube start --driver=docker --profile=minikube-staging
echo "Minikube started successfully with profile minikube-staging!"
