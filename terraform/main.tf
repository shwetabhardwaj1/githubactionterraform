
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-demo-dev-rg"
    storage_account_name = "tfstatedevdeploy"
    container_name       = "tfstate"
    key                  = "${var.environment}.tfstate"
  }

}

data "azurerm_resource_group" "rg" {
  name = "terraform-demo-dev-rg"
}




# Configure the Microsoft Azure Provider
provider "azurerm" {
  //resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}


