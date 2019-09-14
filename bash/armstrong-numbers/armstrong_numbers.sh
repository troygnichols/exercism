#!/usr/bin/env bash

usage() {
	echo "Usage: $(basename "$0") <num>"
	exit 1
}

compute_power_sum() {
	local input="$1"; local pow="$2"; local acc="${3:-0}"
	if ((${#input} == 0)); then
		echo "$acc"
		return 0
	fi
	local digit="${input:0:1}"
	((acc+=digit ** pow))
	compute_power_sum "${input:1}" "$pow" "$acc"
}

main() {
	input="$1"
	pow=${#input}
	sum="$(compute_power_sum "$input" "$pow")"
	((sum == input)) && echo "true" || echo "false"
}

if (( $# != 1 )); then
	usage
fi

main "$@"
