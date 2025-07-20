variable "rgs" {}
variable "vnets" {}
variable "subnets" {}
variable "nic" {}
variable "pip" {}
variable "linux_vm" {}
variable "nsg" {}
variable "ngs-nic-association" {}
variable "secret_id" {
  # default = "df5bc04f-bc51-4028-afa3-8aba54a6c020" Puneet
  default = "193a80b5-b916-4c17-b06d-cfc310d07a2c" #Ankur
}
variable "load_balancer" {}
variable "lb-nic-association" {}


variable "lb_probe" {
  
}