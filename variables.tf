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

variable "is_hns_enabled" {
	type = bool
}

variable "account_tier" {
	type = string
	default = "Standard"
}

variable "account_replication_type" {
	type = string
	default = "LRS"
}

variable "kv_rg_name" {}

variable "kv_name" {}