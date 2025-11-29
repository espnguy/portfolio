# Terraform: Azure Container Deployment (ACR + App Service + Web App)

This project defines a full Azure container deployment using Terraform.  
It provisions:

- Resource Group  
- Azure Container Registry (ACR)  
- App Service Plan (Linux)  
- Azure Web App for Containers  

All infrastructure is defined but NOT deployed unless you run `terraform apply`.

## What This Project Does

This Terraform configuration is capable of:

- Creating an ACR registry to store Docker images  
- Hosting a container-based web application in Web App for Containers  
- Setting App Settings to authenticate to ACR  
- Producing outputs for deployment pipelines  

This is suitable for CI/CD workflows using GitHub Actions.

## Files

- `providers.tf` – Provider config  
- `main.tf` – Infrastructure resources  
- `variables.tf` – Inputs  
- `outputs.tf` – Outputs  
- `README.md` – Documentation  

## Use (Non-Destructive Example)

terraform init
terraform validate
terraform plan

No resources are created unless you run:

terraform apply

## Next Step

This project will be tied into a CI/CD pipeline:

- Build Docker image
- Push to ACR
- Deploy image to Web App
- Fully automated GitHub Actions workflow
