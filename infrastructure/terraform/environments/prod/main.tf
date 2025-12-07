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

module "prod-docker-swarm-manager" {
  source          = "../../modules/vm"
  vmid            = 100
  name            = "docker-swarm-manager"
  description     = "VM that manages the Docker Swarm" 
  target_node     = var.target_node
  cores           = 1
  memory          = 2048
  ipconfig0       = "ip=192.168.1.10/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.docker_swarm_manager_vm_pass
}

module "prod-internal-apps" {
  source          = "../../modules/vm"
  vmid            = 101
  name            = "internal-apps"
  description     = "VM that contains all applications that will access only on the internal network" 
  target_node     = var.target_node
  cores           = 1
  memory          = 4096
  ipconfig0       = "ip=192.168.1.11/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.internal_vm_pass
}

module "prod-external-apps" {
  source          = "../../modules/vm"
  vmid            = 102
  name            = "external-apps"
  description     = "VM that contains all the application that will be access from the internet" 
  target_node     = var.target_node
  cores           = 1
  memory          = 4096
  ipconfig0       = "ip=192.168.1.12/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.external_vm_pass
}
