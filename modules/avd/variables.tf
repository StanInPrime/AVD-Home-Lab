## ./modules/avd/variables.tf


variable "location" {
  type = string
}

variable "resource_group_name" {
    type = string
}

variable "host_pool_name" {
  type = string
  default = "value"
}

variable "friendly_name" {
  type = string
}

variable "validate_environment" {
  type = bool
  default = true
}

variable "start_vm_on_connect" {
  type = bool
  default = true
}

variable "custom_rdp_properties" {
  type = string
  default = "audiocapturemode:i:1;audiomode:i:0;"
}

variable "description" {
  type = string
}

variable "type" {
  type = string
  default = "Pooled"
}

variable "maximum_sessions_allowed" {
  type = number
  default = 9999
}

variable "load_balancer_type" {
  type = string
  default = "BreadthFirst"
}

variable "remoteapp_name" {
  type = string
}

variable "workspace" {
  type = string
}

variable "expiration_date" {
  type = string
  default = "2022-01-01T23:40:52Z"
}

variable "desktop_app_group_name" {
  type = string
}