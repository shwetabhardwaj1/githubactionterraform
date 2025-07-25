variable "resourceGroupName" {
  type        = string
  description = "Resource Group name for Resources"
}

variable "location" {
  type        = string
  description = "Region where resources will reside in"
}

variable "storageAccountName" {
  type        = string
  description = "storage Account Name"
}

variable "client_id" {
  type        = string
  description = "Azure Service Principal Client ID"
}

variable "client_secret" {
  type        = string
  description = "Azure Service Principal Client Secret"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "environment" {
  type        = string
  description = "Deployment environment name (e.g., dev, sit, prod)"
}
