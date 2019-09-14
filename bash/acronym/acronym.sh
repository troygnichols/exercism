#!/usr/bin/env bash

usage() {
  echo "Usage: $(basename "$0") <string to acronymize>"
  exit 1
}

main() {
  # Iterate through the input string.
  # When we encounter the beginning of a word,
  # store it in the accumulator.
  # We are at the beginning of a word
  # when the character prior to the cursor is a non-word.
  # Prime the input by adding a space at the beginning
  # to make sure we find the first word.

  input=" ${@^^}"
  acc=""
  word_pattern="[A-Z']"

  for (( curr=1; curr < ${#input}; curr++ )); do
    curr_char="${input:curr:1}"
    prev_char="${input:curr-1:1}"

    if [[ "$curr_char" = $word_pattern ]] && [[ "$prev_char" != $word_pattern ]]; then
      acc+=$curr_char
    fi
  done

  echo "$acc"
}

if (($# < 1)); then
  usage
fi

main "$@"
