#!/usr/bin/env bash

eval "$(rvm use --quiet default 2> /dev/null && triton profiles -H -o name 2> /dev/null | grep --invert-match env | "${HOME}/.bash/alias/triton.rb")"
