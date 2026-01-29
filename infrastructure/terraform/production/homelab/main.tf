module "homelab" {
  source          = "../../modules/vm"
  vmid            = 100
  name            = "homelab"
  description     = "VM contains all applications part of my homelab" 
  target_node     = var.target_node
  cores           = 3
  memory          = 10240
  ipconfig0       = "ip=192.168.1.10/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.homelab_pass
}
