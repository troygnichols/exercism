#!/usr/bin/env bash

read -d '' COLORS << EOF
  black
  brown
  red
  orange
  yellow
  green
  blue
  violet
  grey
  white
EOF

usage() {
  echo "Usage: $(basename $0) <color1> <color2> <color3>"
}

lookup_color_number() {
  local LINE=$(echo "$COLORS" | grep -n $1 | cut -f1 -d:)
  if [[ -z "$LINE" ]]; then
    echo "invalid color"
    exit 1
  fi
  echo $(($LINE-1))
}

main() {
  ACC=""
  for COLOR in "$@"; do
    ACC+=$(lookup_color_number $COLOR)
  done
  echo $ACC
}

if (( $# < 1 )); then
  usage
  exit 1
fi

main "$@"
