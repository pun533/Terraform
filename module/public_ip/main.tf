resource "azurerm_public_ip" "pip-block" {
    for_each = var.public_ip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  tags = each.value.tags
}

output "public_ip_addresses" {
  value = {
    for name, pip in azurerm_public_ip.pip-block :
    name => pip.ip_address
  }
}

