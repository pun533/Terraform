variable "nsg_nic_association" {
  description = "A map of network interface associations with network security groups"
  type = map(object({
    network_interface_name = string
    network_security_group_name = string
    resource_group_name = string
    tags = optional(map(string))
    
  }))
  
}