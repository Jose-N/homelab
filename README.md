# homelab
Contains Terraform, Ansible, an scripts for setting up our Homelab

## Random Notes
### Terraform
#### Setting up a new Proxomx server
TODO: Script this out at some point
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
TODO: Script this out at some point
`pveam update`

To list availble templates:
TODO: Script this out at some point
`pveam available`

To download template:
TODO: Script this out at some point
`pveam download <storage> <template>`

#### Get LXC Ready for K8s
TODO: Script this out at some point
Edit the config file for the containers `/etc/pve/lxc/$ID.conf` and add the following:

```
lxc.apparmor.profile: unconfined
lxc.cgroup.devices.allow: a
lxc.cap.drop:
lxc.mount.auto: "proc:rw sys:rw"
```
In each LXC `/etc/rc.local` doesn't exist in the default 20.04 LXC template provided by Proxmox. Create it with these contents:

```
#!/bin/sh -e

# Kubeadm 1.15 needs /dev/kmsg to be there, but it's not in lxc, but we can just use /dev/console instead
# see: https://github.com/kubernetes-sigs/kind/issues/662
if [ ! -e /dev/kmsg ]; then
    ln -s /dev/console /dev/kmsg
fi

# https://medium.com/@kvaps/run-kubernetes-in-lxc-container-f04aa94b6c9c
mount --make-rshared /
```

Then run:

```
chmod +x /etc/rc.local
reboot
```
