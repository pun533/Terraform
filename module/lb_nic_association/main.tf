data "azurerm_lb" "lb" {
  for_each = var.lb_nic_association 
  name                = each.value.load_balancer_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb_backend_address_pool" "lb_be_pool" {
  for_each = var.lb_nic_association
  name            = each.value.load_balancer_backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.lb[each.key].id
}

data "azurerm_network_interface" "nic" {
    for_each = var.lb_nic_association
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name  
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_nic_association" {
    for_each = var.lb_nic_association
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = "internal"
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.lb_be_pool[each.key].id
}