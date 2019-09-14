#!/usr/bin/env bash

words="${1//[^a-zA-Z\']/ }"
acronym=""
for word in $words; do
    acronym+="${word:0:1}"
done
echo "${acronym^^}"
