# Proxmox Homelab – Terraform Infrastructure

This repository contains all Terraform code used to provision and manage virtual machines (VMs) and LXC containers across my Proxmox VE cluster in my homelab.

Everything is declarative, version-controlled, and repeatable.

## Overview

- Provider: [telmate/proxmox](https://registry.terraform.io/providers/Telmate/proxmox/latest) (official community provider)
- Proxmox versions tested: 9.x ->
- Resources managed:
  - Cloud-Init templates
  - VM (QEMU)
  - LXC containers
  - Storage (local-lvm, local-zfs, NFS, Ceph in the future)
  - Networks (vlan-aware bridges)
  - Resource pools
  - Users / API tokens (optional)

## Repository Structure

```
├── modules/                  # Reusable modules
│   ├── vm/                   # Full VM module (cloud-init, disks, network, etc.)
│   ├── lxc/                  # LXC container module
│   ├── template/             # Cloud-init template creation
│   └── resource-pool/        # Proxmox resource pools
├── environments/            # Per-environment configurations
│   ├── prod/                 # Main homelab cluster
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── terraform.tfvars  # <-- put your secrets here or use env vars
│   │   └── outputs.tf
│   └── staging/              # Optional second/smaller cluster
├── templates/                # Cloud-init user-data & meta-data snippets
├── scripts/                  # Helper scripts (pre-validate templates, cleanup, etc.)
├── .terraform-version        # Specifies Terraform version (recommended)
├── .terraform.lock.hcl
└── README.md                 # You are here
```


## Prerequisites

1. Proxmox VE cluster up and running
2. A dedicated Proxmox API user (recommended: least-privilege role with `VM.Allocate`, `VM.Config.*`, `Datastore.AllocateTemplate`, etc.)
3. Terraform ≥ 1.6 (we use `.terraform-version` + tfenv/asdf)
4. API token or user/password for the Proxmox provider

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/Jose-N/homelab.git
cd homelab

# 2. Choose your environment
cd infrastructure/terraform/environments/prod

# 3. Copy example vars and fill them
cp terraform.tfvars.example terraform.tfvars
# → edit with your Proxmox host, API token, node names, etc.

# 4. Initialize
terraform init ../../..   # initializes from repo root so modules are found

# 5. Plan & apply
terraform plan
terraform apply
```
```
