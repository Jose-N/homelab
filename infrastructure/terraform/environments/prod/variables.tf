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
