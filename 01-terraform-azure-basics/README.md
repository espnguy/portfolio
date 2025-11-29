# Terraform Azure Basics — Resource Group Deployment

This project demonstrates a simple, real-world Infrastructure-as-Code (IaC) deployment using Terraform and Azure.
It provisions an Azure Resource Group using clean Terraform configuration files and follows modern IaC workflow practices.

This is the foundation for future Azure deployments in this portfolio (storage accounts, networking, app services, Kubernetes, CI/CD, etc.).

---

## Project Overview

Technologies used:

* Terraform (v1+)
* Azure Resource Manager (azurerm provider)
* Azure CLI authentication
* WSL2 + Ubuntu environment

What this project does:

* Authenticates to Azure using `az login`
* Initializes Terraform for Azure
* Deploys a Resource Group in Azure
* Demonstrates providers, variables, outputs, and Terraform workflow

---

## Folder Structure

```
01-terraform-azure-basics/
│
├── main.tf            # Resource Group definition
├── providers.tf       # Terraform settings + Azure provider
├── variables.tf       # Input variables (name, region)
├── outputs.tf         # Output values after deployment
└── README.md          # Documentation for this project
```

---

## How to Use This Project

### 1. Authenticate to Azure

```
az login --use-device-code
```

Terraform will automatically use your authenticated Azure CLI session.

---

### 2. Initialize Terraform

Inside this folder, run:

```
terraform init
```

This downloads the required provider and sets up the working directory.

---

### 3. Preview the Deployment

```
terraform plan
```

Expected output:

```
Plan: 1 to add, 0 to change, 0 to destroy.
```

---

### 4. Apply the Deployment

```
terraform apply
```

When prompted, type:

```
yes
```

Terraform will create the Resource Group defined in `main.tf`.

---

### 5. Verify the Resource Group

Using Azure CLI:

```
az group show \
  --name rg-terraform-basics-mustafa \
  --output table
```

Or verify in the Azure Portal under "Resource groups".

---

## Outputs

Terraform displays outputs such as:

```
resource_group_name
resource_group_location
```

These outputs can be consumed by future modules or deployments.

---

## File Explanations

### providers.tf

```
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

---

### main.tf

```
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
```

---

### variables.tf

Defines input variables so this configuration is reusable and flexible.

---

### outputs.tf

Returns key information after deployment.

---

## Cleanup

To destroy everything created:

```
terraform destroy
```

Confirm with:

```
yes
```

---

## Next Steps (Planned Expansions)

This Terraform baseline project will expand into:

* Azure Storage Account + Terraform remote backend
* Azure App Service deployment
* Modules-based Terraform structure
* GitHub Actions CI/CD pipeline
* Docker container workloads
* Azure Key Vault integration
* Optional: AKS cluster deployment

---

## Author

Mustafa Sunka
Cloud & DevOps Engineer

This project is part of a larger DevOps portfolio demonstrating cloud automation and modern DevOps practices.
