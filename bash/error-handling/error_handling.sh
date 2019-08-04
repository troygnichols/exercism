#!/usr/bin/env bash
set -o errexit
set -o nounset

usage() {
  echo "Usage: ./error_handling <greetee>"
}

main() {
  if (( $# != 1  )); then
    usage
    exit 1
  fi

  echo "Hello, $1"
}

main "$@"
