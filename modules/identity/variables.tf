variable "key_vault_name" {
  type = string
}

variable "location" {
    type = string 
}

variable "resource_group_name" {
  type = string
}

variable "soft_delete_retention_days" {
    type = number
}

variable "sku_name" {
    type = string 
    default = "Standard"
}

variable "tags" {
  type = map(string)  
}

variable "name_assigned_identity" {
  type = string
}

variable "scope" {
  type = string  
}

variable "purge_protection_enabled" {
  type = bool
}


