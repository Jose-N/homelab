# REQUIRED PARAMETERS
variable "target_node" {
  description = "The name of the Proxmox node to be targeted for changes."
  type = string
}

variable "hostname" {
  description = "The hostname of the LXC that will be created"
  type = string
}

variable "lxc_password" {
  description = "The password for the LXC root account"
  type = string
}

variable "memory" {
  description = "The amount of memory assigned to the LXC"
  type = number
}

variable "start" {
  description = "Boolean that determines if the LXC should start on creation"
  type = bool
}

variable "vmid" {
  description = "The VM ID of the LXC"
  type = number
}

variable "ssh_public_keys" {
  description = "A list of ssh public keys in HEREDOC format to be put on the LXC"
  type = string
}

variable "rootfs_size" {
  description = "The size of the file system for the LXC"
  type = string
}

variable "ip" {
  description = "The ip to assign the LXC"
  type = string
}

variable "gateway" {
  description = "The gateway for the LXC to use"
  type = string
}



