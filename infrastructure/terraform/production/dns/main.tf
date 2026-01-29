module "adguard-home" {
  source          = "../../modules/vm"
  vmid            = 200
  name            = "adguard-home"
  description     = "VM runs Adguard Home" 
  target_node     = var.target_node
  cores           = 1
  memory          = 2048
  ipconfig0       = "ip=192.168.1.9/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.adguard_home_vm_pass
}
