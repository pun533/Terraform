module "resource_group" {
  source          = "../../module/resource_group"
  resource_groups = var.rgs
}

module "virtual_network" {
  source     = "../../module/virtual_network"
  vnet       = var.vnets
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../../module/subnet"
  subnet     = var.subnets
  depends_on = [module.virtual_network]

}

module "public_ip" {
  source     = "../../module/public_ip"
  public_ip  = var.pip
  depends_on = [module.subnet]

}
module "network_interface" {
  source            = "../../module/network_interface"
  network_interface = var.nic
  depends_on        = [module.subnet, module.public_ip]
}

module "linux_vm" {
  source     = "../../module/virtual_machine_linux"
  vm_linux   = var.linux_vm
  depends_on = [module.nsg_nic_association]

}

output "public_ip_address" {
  value       = module.public_ip.public_ip_addresses
  description = "The public IP address of the VM"
}

module "nsg" {
  source                  = "../../module/network_security_group"
  network_security_groups = var.nsg
  depends_on              = [module.resource_group]
}

module "nsg_nic_association" {
  source              = "../../module/nsg_nic_association"
  nsg_nic_association = var.ngs-nic-association
  depends_on          = [module.nsg, module.network_interface] 

}