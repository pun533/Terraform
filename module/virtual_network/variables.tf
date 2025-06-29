variable "vnet" {
  description = "Map of virtual networks to create"
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    subnets = optional(map(object({
      name              = string
      address_prefix    = string
      service_endpoints = optional(list(string))
      delegation = optional(object({
        name    = string
        service = string
      }))
    })))
  }))

}