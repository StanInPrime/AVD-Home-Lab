variable "tags" {
  type = map(string)
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "hub_vnet_address_space" {
  type    = list(string)
  default = ["10.1.0.0/16"]
}

variable "hub_subnet_address_space" {
  type    = list(string)
  default = ["10.1.1.0/24"]
}

variable "hub_vnet_name" {
  type = string
}

variable "hub_subnet_name" {
  type = string
}