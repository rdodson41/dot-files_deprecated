#!/usr/bin/env bash

alias g="git"
alias g-="git checkout -"

__git_complete g __git_main

if [[ -f "${HOME}/.bash/alias/git.jq" ]]; then
  eval "$(git alias 2> /dev/null | jq --from-file "${HOME}/.bash/alias/git.jq" --raw-input --raw-output 2> /dev/null)"
fi
