#!/usr/bin/env bash

usage() {
  echo "Usage: $(basename $0) <number>"
}

main() {
  nums=(3 5 7)
  sounds=(Pling Plang Plong)

  acc=""
  for ((i=0; i<${#nums[@]}; i++)); do
    num=${nums[$i]}
    sound=${sounds[$i]}

    if (($1 % $num == 0)); then
      acc+=$sound
    fi
  done

  [ -n "$acc" ] && echo $acc || echo $1
}

if (($# != 1)) || ! [[ "$1" =~ ^[0-9]+$ ]]; then
  usage
  exit 1
fi

main "$@"
