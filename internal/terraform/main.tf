resource "proxmox_lxc" "test" {
  target_node  = "tf-hv-01"
  hostname     = "lxc-test"
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = "BasicLXCContainer"
  memory       = "2G"
  onboot       = true
  start        = true
  unprivileged = true
  vmid         = 100

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}
