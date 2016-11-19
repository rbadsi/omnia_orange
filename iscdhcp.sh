#!/bin/sh

. /lib/functions.sh
. ../netifd-proto.sh
init_proto "$@"

proto_iscdhcp_init_config() {
	renew_handler=1

	proto_config_add_string configfile
	proto_config_add_string vlanprio
}

proto_iscdhcp_setup() {
	local config="$1"
	local iface="$2"

	local configfile vlanprio
	json_get_vars configfile vlanprio

	if [ -n "$vlanprio" ]; then
		for i in 0 1 2 3 4 5 6 7; do
			/sbin/vconfig set_egress_map $iface $i $vlanprio > /dev/null
		done
	fi

	proto_run_command "$config" /usr/sbin/dhclient -d \
		-cf $configfile \
		-lf /var/run/dhclient.$iface.lease $iface
}

proto_iscdhcp_renew() {
	local interface="$1"
	# SIGUSR1 forces dhclient to renew its lease
	local sigusr1="$(kill -l SIGUSR1)"
	[ -n "$sigusr1" ] && proto_kill_command "$interface" $sigusr1
}

proto_iscdhcp_teardown() {
	local interface="$1"
	proto_kill_command "$interface"
}

add_protocol iscdhcp
