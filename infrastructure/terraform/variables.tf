variable "pm_api_url" {
  description = "API URL for the Proxmox server to be affected"
  type        = string
}

variable "pm_api_token_id" {
  description = "API Token ID for the Proxmox server to be affected"
  type        = string
}

variable "pm_api_token_secret" {
  description = "API Token Secret for the Proxmox server to be affected"
  type        = string
}
variable "ip_addr" {
  description = "IP Address for the Proxmox server to run scripts against for K3S node setup"
  type        = string
}

variable "root_password" {
  description = "Root Password for the Proxmox server to run scripts against for K3S node setup"
  type        = string
}

variable "target_node" {
  description = "The name of the Proxmox node to be targeted for changes."
  type        = string
}

variable "lxc_password" {
  description = "The password for the LXC root account"
  type        = string
}

variable "ansible_public_key" {
  description = "SSH Public Key for Ansible to be able to configure the LXC"
  type        = string
  default     = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAu8ek7XKU/Aw/oEmC3vPqVgPr6Iv10h3Q//7QMb35el jose.c.naylor@gmail.com
  EOT
}


variable "load_balancers" {
  description = "List of LXC configurations for load balancers"
  type = list(object({
    hostname    = string
    memory      = number
    vmid        = number
    rootfs_size = string
    ip          = string
    gateway     = string
  }))
  default = [
    { hostname = "lb-01", memory = 2000, vmid = 100, rootfs_size = "16G", ip = "192.168.1.10/24", gateway = "192.168.1.1" },
    { hostname = "lb-02", memory = 2000, vmid = 101, rootfs_size = "16G", ip = "192.168.1.11/24", gateway = "192.168.1.1" },
  ]
}

variable "k3s_nodes" {
  description = "List of LXC configurations for K3S nodes"
  type = list(object({
    hostname    = string
    memory      = number
    vmid        = number
    rootfs_size = string
    ip          = string
    gateway     = string
  }))
  default = [
    { hostname = "k8s-server-001", memory = 2000, vmid = 200, rootfs_size = "16G", ip = "192.168.1.20/24", gateway = "192.168.1.1" },
    { hostname = "k8s-server-002", memory = 2000, vmid = 201, rootfs_size = "16G", ip = "192.168.1.21/24", gateway = "192.168.1.1" },
    { hostname = "k8s-server-003", memory = 2000, vmid = 202, rootfs_size = "16G", ip = "192.168.1.22/24", gateway = "192.168.1.1" },
    { hostname = "k8s-worker-001", memory = 1000, vmid = 300, rootfs_size = "16G", ip = "192.168.1.23/24", gateway = "192.168.1.1" },
    { hostname = "k8s-worker-002", memory = 1000, vmid = 301, rootfs_size = "16G", ip = "192.168.1.24/24", gateway = "192.168.1.1" },
  ]
}

