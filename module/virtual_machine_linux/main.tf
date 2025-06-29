data "azurerm_network_interface" "nic_data" {
    for_each = var.vm_linux
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
  
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
    for_each = var.vm_linux
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password = "aegon@123456"
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.nic_data[each.key].id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}