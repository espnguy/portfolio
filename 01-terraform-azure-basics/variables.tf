variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-terraform-basics-mustafa"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}
