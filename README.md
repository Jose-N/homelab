# homelab
Contains Terraform, Ansible, an scripts for setting up our Homelab

## Random Notes
### Terraform
#### Setting up a new Proxomx server
* Remove the Ceph and PVE enterprise repos
* Add the `pve-no-subscription` repo
* Provision a Terraform Role
  - `pveum role add TerraformProv -privs "Datastore.AllocateSpace Datastore.AllocateTemplate Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt SDN.Use"
`
* Create a Terraform User
* Add Role to Terraform User
  - `pveum aclmod / -user terraform-prov@pve -role TerraformProv`
* Create API Token for Terraform User
#### OS Templates for LXC's

To update the container template database:
`pveam update`

To list availble templates:
`pveam available`

To download template:
`pveam download <storage> <template>`
