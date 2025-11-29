variable "project_name" {
  description = "Base name for all resources"
  type        = string
  default     = "portfolio-container-app"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "acr_sku" {
  description = "ACR SKU (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}

variable "app_service_sku" {
  description = "App Service Plan SKU (e.g. B1, S1)"
  type        = string
  default     = "B1"
}

variable "container_image" {
  description = "Container image reference: acrname.azurecr.io/repo:tag"
  type        = string
  default     = "placeholder.azurecr.io/app:latest"
}
