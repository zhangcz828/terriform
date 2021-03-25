remote_state {
  backend = "azurerm"
  config = {
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    resource_group_name  = "storage-rg"
    storage_account_name = "mystorageacc02"
    container_name       = "dev-container"
  }
}

inputs = {
  location            = "japaneast"
  resource_group_name = "charlie-rg-dev-01"
  vm_size             = "Standard_DS1_v2"
  k8s_node_count      = 1
  k8s_vm_size         = "Standard_A2_v2"
}
