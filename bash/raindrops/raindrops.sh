#!/usr/bin/env bash

usage() {
	echo "Usage: $(basename "$0") <number>" >&2
	exit 1
}

main() {
	input="$1"
	drops=( [3]=Pling [5]=Plang [7]=Plong  )

	acc=""
	for num in "${!drops[@]}"; do
		sound="${drops[$num]}"
		if ((input % num == 0)); then
			acc+=$sound
		fi
	done

	[[ -n "$acc" ]] && echo $acc || echo $1
}

if (($# != 1)) || ! [[ "$1" =~ ^[0-9]+$ ]]; then
	usage
fi

main "$@"
