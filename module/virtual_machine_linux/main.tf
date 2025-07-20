data "azurerm_network_interface" "nic_data" {
  for_each            = var.vm_linux
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name

}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  for_each                        = var.vm_linux
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  tags                            = each.value.tags
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "aegon@123456"
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

  #   custom_data = base64encode(<<EOF
  # #!/bin/bash
  # sudo apt update
  # sudo apt install -y nginx
  # sudo systemctl enable nginx
  # sudo systemctl start nginx
  # EOF
  #   )

  provisioner "file" {
    source      = "index.html"      # local path
    destination = "/tmp/index.html" # remote path

    connection {
      type     = "ssh"
      user     = "adminuser"
      password = "aegon@123456"
      host     = self.public_ip_address
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo mv /tmp/index.html /var/www/html/index.html"
    ]

    connection {
      type     = "ssh"
      user     = "adminuser"
      password = "aegon@123456"
      host     = self.public_ip_address
    }
  }

}
