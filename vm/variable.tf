variable "admin_username" {
    type = string
    description = "Administrator user name for virtual machine"
    default = "zhangcz"
}

variable "admin_password" {
    type = string
    description = "Password must meet Azure complexity requirements"
    default = "Password1234!"
}

variable "location" {}

variable "resource_group_name" {}

variable "vm_size" {
    type = string
    description = "virtual machine size"
    default = "Standard_DS1_v2"
}
