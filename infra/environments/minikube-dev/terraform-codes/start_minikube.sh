#!/bin/bash
echo "Starting Minikube with Docker driver and profile minikube-dev..."
minikube start --driver=docker --profile=minikube-dev
echo "Minikube started successfully with profile minikube-dev!"
