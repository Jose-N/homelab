resource "proxmox_lxc" "lxc" {
  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = var.lxc_password
  cmode        = "shell"
  memory       = var.memory
  onboot       = true
  start        = false
  unprivileged = false
  vmid         = var.vmid

  ssh_public_keys = var.ssh_public_keys

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = var.rootfs_size
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}
