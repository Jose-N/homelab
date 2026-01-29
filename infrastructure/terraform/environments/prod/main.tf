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

module "prod-docker-swarm-worker-1" {
  source          = "../../modules/vm"
  vmid            = 101
  name            = "docker-swarm-worker-1"
  description     = "Worker for Docker Swarm" 
  target_node     = var.target_node
  cores           = 1
  memory          = 3072
  ipconfig0       = "ip=192.168.1.11/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.docker_swarm_worker_1_vm_pass
}

module "prod-docker-swarm-worker-2" {
  source          = "../../modules/vm"
  vmid            = 102
  name            = "docker-swarm-worker-2"
  description     = "Worker for Docker Swarm" 
  target_node     = var.target_node
  cores           = 1
  memory          = 3072
  ipconfig0       = "ip=192.168.1.12/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.docker_swarm_worker_2_vm_pass
}

module "prod-docker-swarm-worker-3-gpu" {
  source          = "../../modules/vm"
  vmid            = 102
  name            = "docker-swarm-worker-3-gpu"
  description     = "Worker for Docker Swarm" 
  target_node     = var.target_node
  cores           = 1
  memory          = 3072
  ipconfig0       = "ip=192.168.1.13/24,gw=192.168.1.1,ip6=dhcp"
  cipassword      = var.docker_swarm_worker_3_gpu_vm_pass
}
