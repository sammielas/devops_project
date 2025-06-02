
# 🚀 FinTech Application Deployment

This project sets up a **secure, Dockerized FinTech application**, provisions a **private Amazon Elastic Container Registry (ECR)** using **Terraform**.

![CI/CD Pipeline](https://imgur.com/a/AAuz0X4) 

## 📌 Features

- 🐳 **Dockerized** for portability and scalability  
- 📦 **Amazon ECR** for secure container image storage  
- 🛠️ **Infrastructure as Code (IaC)** using **Terraform**  

## ✅ Prerequisites

Before you begin, make sure the following are installed and configured:

- [Docker](https://docs.docker.com/get-docker/) – `docker -v`
- [Terraform](https://developer.hashicorp.com/terraform/downloads) – `terraform -version`
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) – `aws configure`

## 📁 Project Structure
```tree
devops_project/
├── app/ # Application source code
├── Dockerfile # Docker build file
├── infra/
│ └── ecr/
│ └── ecr.tf # Terraform config to create ECR
├── README.md
```

> 💡 Ensure you’re in the correct directory when running the following commands.

## 🧭 Deployment Guide

### 1️⃣ Clone the Repository

git clone https://github.com/sammielas/devops_project.git
cd devops_project

### 2️⃣ Provision Amazon ECR with Terraform

Navigate to the Terraform config directory and apply the infrastructure:

cd infra
terraform init
terraform validate
terraform plan
terraform apply --auto-approve

✅ After this, your ECR repository will be provisioned.

### 3️⃣ Authenticate Docker to Amazon ECR
Retrieve an authentication token and log in to your ECR registry using the AWS CLI:

aws ecr get-login-password --region us-east-1 | \
docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<aws_region>.amazonaws.com

> ❗ If you receive an error, ensure you have the latest version of the AWS CLI and Docker installed.

### 4️⃣ Build and Tag the Docker Image

Build your Docker image using the Dockerfile in the project root:

docker build -t repo-name .

After the build completes, tag the image so it points to your ECR repository:

docker tag repo-name:latest <aws_account_id>.dkr.ecr.<aws_region>.amazonaws.com/repo-name:latest

### 5️⃣ Run the App Locally 

You can test the app locally by running:


docker run -p 3001:3001 repo-name


Visit: [http://localhost:3001](http://localhost:3001)


