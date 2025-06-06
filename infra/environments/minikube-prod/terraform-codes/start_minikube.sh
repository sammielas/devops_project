#!/bin/bash
echo "Starting Minikube with Docker driver and profile minikube-prod..."
minikube start --driver=docker --profile=minikube-prod
echo "Minikube started successfully with profile minikube-prod!"
