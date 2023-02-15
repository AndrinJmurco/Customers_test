terraform {
  required_providers {
    netapp-cloudmanager = {
      source = "NetApp/netapp-cloudmanager"
      version = "22.12.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "netapp-cloudmanager" {
  # Configuration options
  sa_client_id         = var.netapp_occm_clientid
  sa_secret_key        = var.netapp_occm_clientsecret
  # may need azure auth
}

provider "azurerm" {
  features {}
#   tenant_id       = var.tenant_id
#   subscription_id = var.subscription_id
#   client_id = var.client_id
#   client_secret = var.client_secret
}