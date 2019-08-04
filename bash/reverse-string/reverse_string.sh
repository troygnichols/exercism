#!/usr/bin/env bash

main() {
  INPUT="$1"
  LEN=${#1}

  ACC=""
  for ((i=$LEN; $i>=0; i--)); do
    ACC+="${INPUT:$i:1}"
  done

  echo $ACC
}

main "$@"
