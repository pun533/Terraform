variable "vm_linux" {
    description = "values for the virtual machine linux module"
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
             ssh_key             = optional(string)
        network_interface_name   = string
    
        os_disk_size_gb     = optional(number, 30)
        tags                = optional(map(string))
    }))
  
}