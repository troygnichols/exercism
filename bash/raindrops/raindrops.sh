#!/usr/bin/env bash

usage() {
  echo "Usage: $(basename $0) <number>"
}

main() {
  NUMS=(3 5 7)
  SOUNDS=(Pling Plang Plong)

  ACC=""
  for ((i=0; i<${#NUMS[@]}; i++)); do
    NUM=${NUMS[$i]}
    SOUND=${SOUNDS[$i]}

    if (($1 % $NUM == 0)); then
      ACC+=$SOUND
    fi
  done

  [ -n "$ACC" ] && echo $ACC || echo $1
}

if (($# != 1)) || ! [[ "$1" =~ ^[0-9]+$ ]]; then
  usage
  exit 1
fi

main "$@"
