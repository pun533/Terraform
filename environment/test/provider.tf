terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.secret_id

# "193a80b5-b916-4c17-b06d-cfc310d07a2c"
}


# golu@gargpuneet092gmail.onmicrosoft.com