data "azurerm_lb" "load_balancer" {
    for_each = var.lb_name
  name                = each.value.lb_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_lb_backend_address_pool" "bepool" {
    for_each = var.lb_name
  loadbalancer_id = data.azurerm_lb.load_balancer[each.key].id
  name            = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "http_probe" {
    for_each = var.lb_name
  name                = "http-probe"
  loadbalancer_id     = data.azurerm_lb.load_balancer[each.key].id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "http_rule" {
   for_each = var.lb_name
  name                           = "http-rule"
  loadbalancer_id                = data.azurerm_lb.load_balancer[each.key].id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicFrontEnd"
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.bepool[each.key].id]
  probe_id                       = azurerm_lb_probe.http_probe[each.key].id
}