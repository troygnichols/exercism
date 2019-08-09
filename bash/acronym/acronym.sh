#!/usr/bin/env bash

letters=($(echo ${@^^} | grep -o -e "[A-Z']\+" | cut -c 1))
IFS=; echo "${letters[*]}"
