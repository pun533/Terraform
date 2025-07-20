rgs = {
  rg1 = {
    name     = "test-rg-1"
    location = "East US"
  }
  # rg2 = {
  #     name     = "test-rg-2"
  #     location = "East US"
  # }
  # rg3 = {
  #     name     = "test-rg-3"
  #     location = "centralindia"
  # }
}

vnets = {
  vnet1 = {
    name                = "test-vnet-1"
    address_space       = ["10.0.0.0/16"]
    location            = "East US"
    resource_group_name = "test-rg-1"
  }
  #     vnet2 = {
  #         name            = "test-vnet-2"
  #         address_space   = ["10.1.0.0/16"]
  #         location        = "East US"
  #         resource_group_name = "test-rg-2"
  # }
}

subnets = {
  subnet1 = {
    name                 = "test-subnet-1"
    address_prefix       = ["10.0.1.0/24"]
    resource_group_name  = "test-rg-1"
    virtual_network_name = "test-vnet-1"
  }
  # subnet2 = {
  #     name           = "test-subnet-2"
  #     address_prefix = ["10.0.2.0/24"]
  #     resource_group_name = "test-rg-1"
  #     virtual_network_name = "test-vnet-1"
  # }
  # subnet3 = {
  #     name           = "test-subnet-1"
  #     address_prefix = ["10.1.1.0/24"]
  #     resource_group_name = "test-rg-2"
  #     virtual_network_name = "test-vnet-2"
  # }

}

pip = {
  pip1 = {
    name                = "test-pip-1"
    location            = "East US"
    resource_group_name = "test-rg-1"
    tags = {
      environment = "test"
      owner       = "devops"
    }
  }
  pip2 = {
    name                = "test-pip-2"
    location            = "East US"
    resource_group_name = "test-rg-1"
    tags = {
      environment = "test"
      owner       = "devops"
    }
  }
  pip3 = {
    name                = "test-pip-3"
    location            = "East US"
    resource_group_name = "test-rg-1"
    tags = {
      environment = "test"
      owner       = "devops"
    }
  }
}



nic = {
  nic1 = {
    name                 = "test-nic-1"
    location             = "East US"
    resource_group_name  = "test-rg-1"
    subnet_name          = "test-subnet-1"
    virtual_network_name = "test-vnet-1"
    public_ip_name       = "test-pip-1" # Optional, if you want to associate a public IP
    tags = {
      environment = "test"
      owner       = "devops"
    }
  }
  nic2 = {
    name                 = "test-nic-2"
    location             = "East US"
    resource_group_name  = "test-rg-1"
    subnet_name          = "test-subnet-1"
    virtual_network_name = "test-vnet-1"
    public_ip_name       = "test-pip-2" # Optional, if you want to associate a public IP
    tags = {
      environment = "test"
      owner       = "devops"
    }
  }
}

nsg = {
  nsg1 = {
    nsg_name            = "test-nsg-1"
    location            = "East US"
    resource_group_name = "test-rg-1"
    tags = {
      environment = "test"
      owner       = "devops"
    }
    security_rule = {
      sc1 = {
        name = "Allow-SSH"

        destination_port_range = "22"

      }
      sc2 = {
        name = "Allow-HTTP"

        destination_port_range = "80"

      }
    }
  }

}

ngs-nic-association = {
  nsg_nic1 = {
    network_interface_name      = "test-nic-1"
    network_security_group_name = "test-nsg-1"
    resource_group_name         = "test-rg-1"

  }

  nsg_nic2 = {
    network_interface_name      = "test-nic-2"
    network_security_group_name = "test-nsg-1"
    resource_group_name         = "test-rg-1"

  }

}

linux_vm = {
  vm1 = {
    name                   = "test-vm-1"
    location               = "East US"
    resource_group_name    = "test-rg-1"
    network_interface_name = "test-nic-1" # This should match the NIC created above               
    tags = {
      environment = "test"
      owner       = "devops"
    }
  }

  vm2 = {
    name                   = "test-vm-2"
    location               = "East US"
    resource_group_name    = "test-rg-1"
    network_interface_name = "test-nic-2" # This should match the NIC created above               
    tags = {
      environment = "test"
      owner       = "devops"
    }
  }
}


load_balancer = {
  lb1 = {
    name                           = "test-lb-1"
    location                       = "East US"
    resource_group_name            = "test-rg-1"
    pip_name                       = "test-pip-3" # Optional, if you want to associate a public IP
      }

}

lb_probe = {
  probe1 = {
    lb_name = "test-lb-1"  
    resource_group_name = "test-rg-1"  
    
  }
}

lb-nic-association = {
  lb_nic1 = {
    network_interface_name                  = "test-nic-1"
    load_balancer_name                      = "test-lb-1"
    load_balancer_backend_address_pool_name = "BackEndAddressPool"
    resource_group_name                     = "test-rg-1"
  }

  lb_nic2 = {
    network_interface_name                  = "test-nic-2"
    load_balancer_name                      = "test-lb-1"
    load_balancer_backend_address_pool_name = "BackEndAddressPool"
    resource_group_name                     = "test-rg-1"
  }
}