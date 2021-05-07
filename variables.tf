variable "vm-name-prefix" {
    type = list(string)
    description = "name prefix for the vms"
    default = ["jenkins", "gitlab"]
}

variable "vm_size" {
  type = string
    description = "size of VM"
    default = "Standard_D4s_v3"
}

variable "admin_user" {
  type = string
    description = "admin username"
    default = "daniela"
}

variable "location" {
  type = string
    description = "location for resources"
    default = "centralus"
}
