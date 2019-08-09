#!/usr/bin/env bash

check_input() {
  if (($# !=2)); then
    echo "Usage: $(basename "$0") <string1> <string2>"
    return 1
  fi
  if ((${#1} != ${#2})); then
    if ((${#1} == 0)); then
      echo "left strand must not be empty"
    elif ((${#2} == 0)); then
      echo "right strand must not be empty"
    else
      echo "left and right strands must be of equal length"
    fi
    return 1
  fi
}

compare() {
  dist=0
  for ((i=0; i<${#1}; i++)); do
    [[ "${1:$i:1}" != "${2:$i:1}" ]] && ((dist++))
  done
  echo $dist
}

check_input "$@" && compare "$@"
