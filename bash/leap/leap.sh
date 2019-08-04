#!/usr/bin/env bash

usage() {
  echo "Usage: $(basename $0) <year>"
}

check_args() {
  if [[ "$#" -ne 1 ]] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
    usage
    exit 1
  fi
}

main() {
  YEAR=$1

  if (( $YEAR % 4 != 0 )); then
    echo 'false'
    return 0
  fi

  if (( $YEAR % 100 != 0 )) || (( $YEAR % 400 == 0 )); then
    echo 'true'
    return 0
  fi

  echo 'false'
  return 0
}

check_args "$@"
main "$@"

