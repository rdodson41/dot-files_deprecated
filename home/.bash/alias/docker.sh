#!/usr/bin/env bash

if [[ -f "${HOME}/.bash/alias/docker.jq" && -f "${HOME}/.docker/services.json" ]]; then
  eval "$(jq --from-file "${HOME}/.bash/alias/docker.jq" --raw-output < "${HOME}/.docker/services.json" 2> /dev/null)"
fi
