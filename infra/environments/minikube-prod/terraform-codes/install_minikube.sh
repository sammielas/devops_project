#!/bin/bash
if ! command -v minikube &> /dev/null; then
    echo "Installing Minikube..."
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube
    sudo mv minikube /usr/local/bin/
    echo "Minikube installation completed."
else
    echo "Minikube is already installed."
fi
