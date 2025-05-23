
# FinTech Application Deployment

This project sets up a **secure, lightweight Dockerized FinTech application** and provisions an **Amazon Elastic Container Registry (ECR)** using **Terraform** for container storage.

## Project Overview
- 🏗 **Dockerized** for efficiency and scalability  
- 🌍 **Infrastructure as Code (IaC)** using **Terraform**  
- 🚀 **Amazon ECR** for private, secure image storage  
- 🔄 **Git workflow** following **feature branch strategy, pull requests, and code reviews**  

---

## Prerequisites

Before you begin, ensure you have:
- Docker installed (`docker -v` to verify)
- Terraform installed (`terraform -version`)
- AWS CLI configured (`aws configure`)
- GitHub CLI (for managing pull requests)

---

## Setup Instructions

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your-repo/fintech-app.git
cd fintech-app
```

### 2️⃣ Build and Run the Docker Image Locally
```sh
docker build -t fintech-app .
docker run -p 3001:3001 fintech-app
```
- Access the app via: `http://localhost:3001`

### 3️⃣ Push Image to Private Amazon ECR
Authenticate and push the image:
```sh
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com
docker tag fintech-app <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/fintech-app:latest
docker push <aws_account_id>.dkr.ecr.us-east-1.amazonaws.com/fintech-app:latest
```

### 4️⃣ Provision Amazon ECR using Terraform
```sh
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```
- Verify repository exists:
```sh
aws ecr describe-repositories --region us-east-1 | jq '.repositories[].repositoryName'
```




