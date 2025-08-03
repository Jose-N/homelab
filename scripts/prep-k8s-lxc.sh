#!/bin/bash
# /homelab/scripts/prep-k8s-lxc.sh

function set_lxc_permissions {
echo "Setting LXC permissions for LXC: $1"
cat >> /etc/pve/lxc/$1.conf <<EOF
lxc.apparmor.profile: unconfined
lxc.cgroup.devices.allow: a
lxc.cap.drop:
lxc.mount.auto: "proc:rw sys:rw"
EOF
echo "Finished setting LXC permissions for LXC: $1"
}

function push_kernel_boot_config_to_lxc {
	echo "Pushing the Kernel Boot config into LXC: $1"
	pct push "$1" /boot/config-$(uname -r) /boot/config-$(uname -r)
}

function change_sshd_config {
	echo "Editing sshd config on LXC: $1"
	lxc-attach --name "$1" -- sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
	lxc-attach --name "$1" -- sed -i -e 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
	#ChallengeResponseAuthentication no
	echo "Done editing sshd config on LXC: $1"

	echo "Restarting SSH Service"
	lxc-attach --name "$1" -- service ssh restart
	echo "Restarted SSH Service"
	return 0
}

echo "##### EDITING LXC PERMISSIONS #####"
set_lxc_permissions "100"
set_lxc_permissions "101"
set_lxc_permissions "102"

echo
echo
echo
echo "##### STARTING LXCS #####"
pct start 100
pct start 101
pct start 102
echo "##### FINISHED STARTING LXCS #####"

echo
echo
echo
echo "##### PUSHING KERNEL BOOT TO LXCS #####"
push_kernel_boot_config_to_lxc "100"
push_kernel_boot_config_to_lxc "101"
push_kernel_boot_config_to_lxc "102"

echo
echo
echo
echo "##### EDITING LXCS SSHD CONFIG #####"
change_sshd_config "100"
change_sshd_config "101"
change_sshd_config "102"
exit
