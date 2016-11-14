#!/usr/bin/env bash

export GPG_TTY="$(tty)"

if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  source "${HOME}/.gpg-agent-info"
fi

if [[ -S "${GPG_AGENT_INFO%%:*}" ]]; then
  export GPG_AGENT_INFO
else
  eval "$(gpg-agent --daemon --write-env-file 2> /dev/null)"
fi
