provider "azurerm" {
  version = "=1.39.0"
}
terraform {
  backend "azurerm" {}
}

module "vm" {
  source = "../vm"
  location = var.location
  resource_group_name = var.resource_group_name
  vm_size = var.vm_size
}

module "k8s" {
  source = "../kubernetes"
  location = var.location
  resource_group_name = var.resource_group_name
  k8s_node_count = var.k8s_node_count
  k8s_vm_size = var.k8s_vm_size
}

variable "k8s_node_count" {}

variable "k8s_vm_size" {}

variable "location" {}

variable "resource_group_name" {}

variable "vm_size" {}
