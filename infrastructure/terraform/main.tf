module "load_balancers" {
  source          = "./modules/lxc"
  for_each        = { for load_balancer in var.load_balancers : load_balancer.hostname => load_balancer }
  target_node     = var.target_node
  hostname        = each.value.hostname
  lxc_password    = var.lxc_password
  memory          = each.value.memory
  vmid            = each.value.vmid
  ssh_public_keys = var.ansible_public_key
  rootfs_size     = each.value.rootfs_size
  ip              = each.value.ip
}

module "k3s_nodes" {
  source          = "./modules/lxc"
  for_each        = { for node in var.k3s_nodes : node.hostname => node }
  target_node     = var.target_node
  hostname        = each.value.hostname
  lxc_password    = var.lxc_password
  memory          = each.value.memory
  vmid            = each.value.vmid
  ssh_public_keys = var.ansible_public_key
  rootfs_size     = each.value.rootfs_size
  ip              = each.value.ip
}

resource "null_resource" "k3s_node_setup" {
  for_each   = { for node in var.k3s_nodes : node.hostname => node }
  depends_on = [module.k3s_nodes]

  provisioner "remote-exec" {
    inline = [
      "echo '##### EDITING LXC PERMISSIONS #####'",
      "echo 'Setting LXC permissions for LXC: ${each.value.vmid}'",
      "echo 'lxc.apparmor.profile: unconfined' >> /etc/pve/lxc/${each.value.vmid}.conf",
      "echo 'lxc.cgroup.devices.allow: a' >> /etc/pve/lxc/${each.value.vmid}.conf",
      "echo 'lxc.cap.drop:' >> /etc/pve/lxc/${each.value.vmid}.conf",
      "echo 'lxc.mount.auto: \"proc:rw sys:rw\"' >> /etc/pve/lxc/${each.value.vmid}.conf",
      "echo 'Finished setting LXC permissions for LXC: ${each.value.vmid}'",
      "echo",
      "echo",
      "echo",
      "echo '##### STARTING LXC #####'",
      "pct start ${each.value.vmid}",
      "echo",
      "echo",
      "echo",
      "echo '##### PUSHING KERNEL BOOT TO LXC #####'",
      "pct push ${each.value.vmid} /boot/config-$(uname -r) /boot/config-$(uname -r)",
      "echo",
      "echo",
      "echo",
      "echo '##### EDITING LXC SSHD CONFIG #####'",
      "echo 'Editing sshd config on LXC: ${each.value.vmid}'",
      "lxc-attach --name ${each.value.vmid} -- sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config",
      "lxc-attach --name ${each.value.vmid} -- sed -i -e 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config",
      "echo 'Done editing sshd config on LXC: $1'",
      "echo 'Restarting SSH Service'",
      "lxc-attach --name ${each.value.vmid} -- service ssh restart",
      "echo 'Restarted SSH Service'",
    ]
  }

  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = var.ip_addr
    timeout  = "2m"
  }
}
