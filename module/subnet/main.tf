resource "azurerm_subnet" "sub_network" {
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefix
  service_endpoints    = each.value.service_endpoints


}