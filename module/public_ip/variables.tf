variable "public_ip" {  
  description = "Map of public IPs to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
  
}