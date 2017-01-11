#!/usr/bin/env bash

if [[ -x "${HOME}/.bash/alias/docker.rb" && -f "${HOME}/.docker/services.yml" ]]; then
  eval "$("${HOME}/.bash/alias/docker.rb")"
fi
