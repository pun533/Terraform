variable "network_security_groups" {
    description = "A map of network security groups to create"
    type = map(object({
        nsg_name             = string
        location             = string
        resource_group_name  = string
        tags                 = optional(map(string))
        security_rule = map(object({
            name                       = string        
            
            destination_port_range     = string
            
        }))
    }))
  
}