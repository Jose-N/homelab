variable "vmid" {
  description = "Id of the VM"
  type = number
}

variable "name" {
  description = "Name of the VM"
  type = string
}

variable "target_node" {
  description = "Proxmox node to target for changes"
  type = string
}

variable "cores" {
  description = "Number of cores to provision for VM"
  type = number
}

variable "memory" {
  description = "Amount of memory to provision for VM"
  type = number
}
