#!/usr/bin/env bash

if [[ -f "${HOME}/.bash/alias/triton.jq" ]]; then
  eval "$(triton profiles --json 2> /dev/null | jq --from-file "${HOME}/.bash/alias/triton.jq" --raw-output 2> /dev/null)"
fi
