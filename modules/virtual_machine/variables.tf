variable "resource_group_name" {
  type = string
}

variable "location" {
  type =string
  default = "eastus2"
}

variable "prefix" {
  type= string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "vm_size" {
  type= string
}

variable "vm_password" {
}