variable "network_interface" {
  description = "Map of network interfaces to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    virtual_network_name = string
    public_ip_name = optional(string)
    tags     = optional(map(string))
  }))   

}