variable "lxc_pass" {
  type = string
}

resource "proxmox_lxc" "k8s-control" {
  target_node  = "tf-hv-01"
  hostname     = "k8s-control"
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = var.lxc_pass
  cmode        = "shell"
  memory       = 2000
  onboot       = true
  start        = false
  unprivileged = false
  vmid         = 100

  // Ansible pub ssh key
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAu8ek7XKU/Aw/oEmC3vPqVgPr6Iv10h3Q//7QMb35el jose.c.naylor@gmail.com
  EOT

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}

resource "proxmox_lxc" "k8s-worker-001" {
  target_node  = "tf-hv-01"
  hostname     = "k8s-worker-001"
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = var.lxc_pass
  cmode        = "shell"
  memory       = 1000
  onboot       = true
  start        = false
  unprivileged = false
  vmid         = 101

  // Ansible pub ssh key
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAu8ek7XKU/Aw/oEmC3vPqVgPr6Iv10h3Q//7QMb35el jose.c.naylor@gmail.com
  EOT

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}

resource "proxmox_lxc" "k8s-worker-002" {
  target_node  = "tf-hv-01"
  hostname     = "k8s-worker-002"
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = var.lxc_pass
  cmode        = "shell"
  memory       = 1000
  onboot       = true
  start        = false
  unprivileged = false
  vmid         = 102

  // Ansible pub ssh key
  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAu8ek7XKU/Aw/oEmC3vPqVgPr6Iv10h3Q//7QMb35el jose.c.naylor@gmail.com
  EOT

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}
