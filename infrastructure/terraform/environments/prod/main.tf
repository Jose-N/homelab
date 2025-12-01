module "komodo" {
  source          = "../../modules/vm"
  vmid            = 100
  name            = "komodo"
  target_node     = var.target_node
  cores           = 1
  memory          = 2048
  ipconfig0       = "ip=192.168.1.10/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.komodo_vm_pass
}
