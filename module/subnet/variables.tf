variable "subnet" {
  description = "Map of subnets to create"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefix       = list(string)
    service_endpoints    = optional(list(string))
    delegation = optional(object({
      name    = string
      service = string
    }))
  }))
}