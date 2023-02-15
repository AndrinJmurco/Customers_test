# Determines the labs_vnet_name to use, based on the azure_region provided
locals {
  r_Suffix =  var.resource_Suffix != "" ? var.resource_Suffix : ""  
  #     vnet_name = var.azure_region == "eastus2" ? var.labs_vnet_name_eastus2 : var.labs_vnet_name_northeurope
}


# # gets the current labs_vnet that is in use for this labs environment; name is derived from locals
# data "azurerm_virtual_network" "labs_vnet" {
#   name                = var.lab_vnet_name
#   resource_group_name = var.labs_vnet_rg
# }

# gets the current subscription information
data "azurerm_subscription" "current" {}

# Creation of the NetApp resource itself
resource "netapp-cloudmanager_cvo_azure" "cl-azure" {

  provider = netapp-cloudmanager
  name = "netapp${var.lab_id}"
  location = var.azure_region
  subscription_id = data.azurerm_subscription.current.subscription_id
  subnet_id = var.lab_subnet_name
  security_group_id = var.lab_nsg_id
  # vnet_id = data.azurerm_virtual_network.labs_vnet.name
  vnet_id = var.lab_vnet_name
  # vnet_resource_group = data.azurerm_virtual_network.labs_vnet.resource_group_name
  vnet_resource_group = var.labs_vnet_rg
  resource_group = var.lab_rg_name
  allow_deploy_in_existing_rg = true
  # cidr = data.azurerm_virtual_network.labs_vnet.address_space[0]
  cidr = var.labs_vnet_cidr
#   azure_tag {
#               tag_key = "abcd"
#               tag_value = "ABCD"
#             }
#   azure_tag {
#               tag_key = "xxx"
#               tag_value = "YYY"
#             }

  storage_type = "Standard_LRS"
  svm_password = var.netapp_occm_svm_password
  client_id = var.netapp_occm_connectorid
  workspace_id = var.netapp_occm_workspaceid
  capacity_package_name = "Freemium"
  disk_size = "100"
  disk_size_unit = "GB"
  instance_type = "Standard_E4s_v3"
  enable_compliance = true
  enable_monitoring = true
  cloud_provider_account = var.netapp_occm_providerid

}