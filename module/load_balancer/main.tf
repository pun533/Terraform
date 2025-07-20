data "azurerm_public_ip" "pip_lb" {
    for_each = var.lb_name
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_lb" "lb" {
    for_each = var.lb_name
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  

  frontend_ip_configuration {
    name                 = "PublicFrontEnd" 
    public_ip_address_id = data.azurerm_public_ip.pip_lb[each.key].id
  }
}



# resource "azurerm_lb_probe" "probe" {
#     for_each = var.lb_name
#   name                = "http-probe"    
#   loadbalancer_id     = azurerm_lb.lb[each.key].id
#   protocol            = "Http"
#   port                = 80
#   request_path        = "/"
#   interval_in_seconds = 5
#   number_of_probes    = 2
  
# }

# resource "azurerm_lb_rule" "lbrule" {
#     for_each = var.lb_name
#   name                           = "http-rule"  
#   loadbalancer_id                = azurerm_lb.lb[each.key].id
#   protocol                       = "Tcp"
#   frontend_port                  = 80
#   backend_port                   = 80
#   frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bepool[each.key].id]
#   probe_id                       = azurerm_lb_probe.probe[each.key].id
#     idle_timeout_in_minutes       = 4
# }