#!/usr/bin/env bash

if [[ -f "${HOME}/.docker/services.yml" ]]; then
  eval "$(rvm use --quiet default 2> /dev/null && "${HOME}/.bash/alias/docker.rb" < "${HOME}/.docker/services.yml")"
fi
