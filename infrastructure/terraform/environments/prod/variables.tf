variable "pm_api_url" {
  description = "API URL for the Proxmox server to be affected"
  type        = string
}

variable "pm_api_token_id" {
  description = "API Token ID for the Proxmox server to be affected"
  type        = string
}

variable "pm_api_token_secret" {
  description = "API Token Secret for the Proxmox server to be affected"
  type        = string
}

variable "target_node" {
  description = "Proxmox node to target for changes"
  type = string
}

variable "adguard_home_vm_pass" {
  description = "Password for root user of adguard home vm"
  type = string
}

variable "docker_swarm_manager_vm_pass" {
  description = "Password for root user of docker swarm manager vm"
  type = string
}

variable "docker_swarm_worker_1_vm_pass" {
  description = "Password for docker swarm worker 1 vm"
  type = string
}

variable "docker_swarm_worker_2_vm_pass" {
  description = "Password for docker swarm worker 2 vm"
  type = string
}

variable "docker_swarm_worker_3_gpu_vm_pass" {
  description = "Password for docker swarm worker 3 with a GPU vm"
  type = string
}
