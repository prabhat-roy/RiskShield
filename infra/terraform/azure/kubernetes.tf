resource "azurerm_kubernetes_cluster" "this" {
  name                = "riskshield-${var.environment}"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  dns_prefix          = "riskshield-${var.environment}"
  kubernetes_version  = var.aks_version

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name                 = "general"
    vm_size              = var.node_vm_size
    auto_scaling_enabled = true
    min_count            = var.node_min
    max_count            = var.node_max
    vnet_subnet_id       = azurerm_subnet.aks.id
    os_disk_size_gb      = 200
    node_labels          = { workload = "general" }
  }

  identity { type = "SystemAssigned" }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "cilium"
    load_balancer_sku = "standard"
    service_cidr      = "10.71.0.0/16"
    dns_service_ip    = "10.71.0.10"
  }

  azure_policy_enabled = true
}

resource "azurerm_kubernetes_cluster_node_pool" "actuarial" {
  name                  = "actuarial"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_F8s_v2"
  auto_scaling_enabled  = true
  min_count             = 2
  max_count             = 10
  vnet_subnet_id        = azurerm_subnet.aks.id
  node_labels           = { workload = "actuarial" }
  node_taints           = ["workload=actuarial:NoSchedule"]
}
