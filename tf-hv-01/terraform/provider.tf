terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.2-rc03"
    }
  }
}

variable "pm_api_url" {
	type = string
}

variable "pm_api_token_id" {
	type = string
}

variable "pm_api_token_secret" {
	type = string
}

provider "proxmox" {
	pm_api_url = var.pm_api_url
	pm_api_token_id = var.pm_api_token_id
	pm_api_token_secret = var.pm_api_token_secret
	pm_tls_insecure = true
}
