data "azurerm_subnet" "subnet_data" {
    for_each = var.network_interface
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip_data" {
    for_each = var.network_interface
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface" "nic" {
    for_each = var.network_interface
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags = each.value.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = "Dynamic"    
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key] != null ? data.azurerm_public_ip.pip_data[each.key].id : null
  } 
}