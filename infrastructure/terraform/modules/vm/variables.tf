variable "vmid" {
  description = "Id of the VM"
  type = number
}

variable "name" {
  description = "Name of the VM"
  type = string
}

variable "description" {
  description = "Description of the VM"
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

variable "ipconfig0" {
  description = "Network configuration for VM"
  type = string
}

variable "cipassword" {
  description = "Password for root user of VM"
  type = string
}

variable "hd_size" {
  description = "Size of Hard Drive space"
  type = string
}
