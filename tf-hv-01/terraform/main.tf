resource "proxmox_lxc" "k8s-control" {
  target_node  = "tf-hv-01"
  hostname     = "k8s-control"
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = "BasicLXCContainer"
  cmode        = "shell"
  memory       = 2000
  onboot       = true
  start        = true
  unprivileged = false

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw     = "192.168.4.1"
    ip     = "172.20.80.1/16"
  }
}

resource "proxmox_lxc" "k8s-worker-001" {
  target_node  = "tf-hv-01"
  hostname     = "k8s-worker-001"
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = "BasicLXCContainer"
  cmode        = "shell"
  memory       = 1000
  onboot       = true
  start        = true
  unprivileged = false

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw     = "192.168.4.1"
    ip     = "172.20.81.1/16"
  }
}

resource "proxmox_lxc" "k8s-worker-002" {
  target_node  = "tf-hv-01"
  hostname     = "k8s-worker-002"
  ostemplate   = "local:vztmpl/ubuntu-25.04-standard_25.04-1.1_amd64.tar.zst"
  password     = "BasicLXCContainer"
  cmode        = "shell"
  memory       = 1000
  onboot       = true
  start        = true
  unprivileged = false

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    gw     = "192.168.4.1"
    ip     = "172.20.82.1/16"
  }
}
