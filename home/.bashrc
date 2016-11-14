#!/usr/bin/env bash

export KERNAL_NAME="$(uname)"

if [[ "${KERNAL_NAME}" == "Darwin" ]] && which brew &> /dev/null; then
  export USR_LOCAL="$(brew --prefix)"
else
  export USR_LOCAL="/usr/local"
fi

if [[ "${KERNAL_NAME}" == "Darwin" && -d "${USR_LOCAL}/opt/coreutils/libexec/gnubin" ]]; then
  export PATH="${USR_LOCAL}/opt/coreutils/libexec/gnubin:${PATH}"
fi

if [[ "${KERNAL_NAME}" == "Darwin" && -d "${USR_LOCAL}/opt/coreutils/libexec/gnuman" ]]; then
  if [[ -n "${MANPATH}" ]]; then
    export MANPATH="${USR_LOCAL}/opt/coreutils/libexec/gnuman:${MANPATH}"
  else
    export MANPATH="${USR_LOCAL}/opt/coreutils/libexec/gnuman"
  fi
fi

if [[ -d "${HOME}/.rvm/bin" ]]; then
  export PATH="${HOME}/.rvm/bin:${PATH}"
fi

if [[ -d "${HOME}/.nvm" ]]; then
  export NVM_DIR="${HOME}/.nvm"
fi

export GPG_TTY="$(tty)"

shopt -s globstar &> /dev/null

if [[ -f "${USR_LOCAL}/etc/bash_completion" ]]; then
  source "${USR_LOCAL}/etc/bash_completion"
fi

if [[ -f "${HOME}/.bash/aliases" ]]; then
  source "${HOME}/.bash/aliases"
fi

if [[ -f "${HOME}/.bash/prompt" ]]; then
  source "${HOME}/.bash/prompt"
fi

if [[ -f "${HOME}/.bash/local" ]]; then
  source "${HOME}/.bash/local"
fi

if [[ -f "${HOME}/.nvm/nvm.sh" ]]; then
  source "${HOME}/.nvm/nvm.sh"
fi

if [[ -f "${HOME}/.rvm/scripts/rvm" ]]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

if [[ -f "${HOME}/.gpg-agent-info" ]]; then
  source "${HOME}/.gpg-agent-info"
fi

if [[ -f "${HOME}/.dircolors" ]]; then
  eval "$(dircolors "${HOME}/.dircolors" 2> /dev/null)"
fi

if [[ -S "${GPG_AGENT_INFO%%:*}" ]]; then
  export GPG_AGENT_INFO
else
  eval "$(gpg-agent --daemon --write-env-file 2> /dev/null)"
fi
