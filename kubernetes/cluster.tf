resource "azurerm_kubernetes_cluster" "demo-cluster" {
  name                = "demo-cluster"
  location            = azurerm_resource_group.demo.location
  resource_group_name = azurerm_resource_group.demo.name
  dns_prefix          = "demo-cluster"

  default_node_pool {
    name       = "default"
    node_count = var.k8s_node_count
    #vm_size    = "Standard_A2_v2"
    vm_size    = var.k8s_vm_size
  }

  service_principal {
    client_id     = azuread_service_principal.aks-demo.application_id
    client_secret = random_password.aks-demo-sp-password.result
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.demo-cluster.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.demo-cluster.kube_config_raw
}
