#!/usr/bin/env bash

usage() {
  echo "Usage: $(basename $0) <expr>"
}

############################################################
# 1. Tokenize input into only the bracket characters
#   we are interested in:
#   [(foo([foobar]{baz,qux}))] => [(([]{}))]
#
# 2. Parse the tokens recursively. Find matching brackets like:
#   (), [], {}
#   and remove them.
#
# 3. When done, the list should be empty,
#   or there was an unbalanced bracket.
############################################################

tokenize() {
  TOKENS=$(echo $1 | grep -o -e "[])}[({]" | tr -d "\n")
}

parse() {
  local len=${#TOKENS}
  REMAINING=$TOKENS
  while true; do
    REMAINING=$(echo $REMAINING | sed 's/()//g' | sed 's/\[\]//g' | sed 's/{}//g')
    if ((${#REMAINING} == $len)); then
      # Seen same string twice, can't be reduced any more.
      break
    fi
    len=${#REMAINING}
  done
}

print_results() {
  [[ -z $REMAINING ]] && echo "true" || echo "false"
}

main() {
  tokenize "$1"
  parse "$TOKENS"
  print_results "$REMAINING"
}

if (($# != 1)); then
  usage
  exit 1
fi

main "$@"
