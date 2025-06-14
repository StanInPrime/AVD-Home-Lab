variable "tags" {
  type = map(string)  
}

variable "location" {
    type = string 
}

variable "resource_group_name" {
  type = string
}

variable "vnet_address_space" {
 type = list(string)
 default = ["10.0.0.0/16"]
}

variable "subnet_address_space" {
 type = list(string)
 default = ["10.0.1.0/24"]
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}