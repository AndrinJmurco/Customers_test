variable "azure_region" {
    type = string
}

variable "labs_vnet_rg" {
    type = string
}

# variable "labs_vnet_name_eastus2" {
#     type = string
# }

# variable "labs_vnet_name_northeurope" {
#     type = string
# }

variable "lab_vnet_name" {
    type = string
}

variable "labs_vnet_cidr" {
    type = string
}

variable "netapp_occm_clientid" {
    type = string
    sensitive = true
}

variable "netapp_occm_clientsecret" {
    type = string
    sensitive = true
}

variable "netapp_occm_connectorid" {
    type = string
    sensitive = true
}

variable "netapp_occm_workspaceid" {
    type = string
}

variable "netapp_occm_providerid" {
    type = string
}

variable "netapp_occm_svm_password" {
    type = string
    sensitive = true
}

variable "lab_id" {
    type = string
}

variable "lab_rg_name" {
    type = string
}

variable "lab_subnet_name" {
    type = string
}

variable "lab_nsg_id" {
    type = string
}

variable "resource_Suffix" {
    type = string
}