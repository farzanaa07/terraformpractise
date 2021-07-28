terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }
  # in production environments you should keep your state secure and encrypted 
  # best way to do this is by running Terraform in a remote environment with shared access to state
  # terraform remote backends allow Terraform to use a shared storage space for state data

  backend "remote" {
      organization = "company-avanade"
      workspaces {
          name = "Example-Workspace"
      }
  }
}
# Provider configures the specified provider (azurerm). This acts as a plugin that Terraform uses to create and manage your resources 
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  # creating a resource group named "my-first-tf-rg using variable from variable.tf
  name     = var.resource_group_name
  location = "uksouth"
#adding tags
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}
# need to specify the resource group to contain the vnet - establish dependency between the resources