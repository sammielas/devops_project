
# Define required Terraform providers
provider "local" {} # Used to execute local scripts
provider "null" {}  # Allows execution of custom scripts via local-exec

# Write the install script to a file
resource "local_file" "install_minikube_script" {
  filename = "${path.module}/install_minikube.sh"
  content  = <<EOT
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
EOT
}

# Execute the install script
resource "null_resource" "install_minikube" {
  depends_on = [local_file.install_minikube_script]

  provisioner "local-exec" {
    command = "bash ${path.module}/install_minikube.sh"
  }
}

# Write the start script to a file
resource "local_file" "start_minikube_script" {
  filename = "${path.module}/start_minikube.sh"
  content  = <<EOT
#!/bin/bash
echo "Starting Minikube with Docker driver and profile minikube-prod..."
minikube start --driver=docker --profile=minikube-prod
echo "Minikube started successfully with profile minikube-prod!"
EOT
}

# Execute the start script
resource "null_resource" "start_minikube" {
  depends_on = [null_resource.install_minikube]

  provisioner "local-exec" {
    command = "bash ${path.module}/start_minikube.sh"
  }
}

# Output message indicating successful Minikube setup
output "minikube_status" {
  value = "Minikube has been successfully installed and started with the profile 'minikube-prod'!"
}
