#!/usr/bin/env bash

if which brew &> /dev/null; then
  USR_LOCAL="$(brew --prefix)"
else
  USR_LOCAL="/usr/local"
fi

if [[ -d "${USR_LOCAL}/opt/coreutils/libexec/gnubin" ]]; then
  PATH="${USR_LOCAL}/opt/coreutils/libexec/gnubin:${PATH}"
fi

if [[ -d "${USR_LOCAL}/opt/coreutils/libexec/gnuman" ]]; then
  MANPATH="${USR_LOCAL}/opt/coreutils/libexec/gnuman:${MANPATH}"
fi

if [[ -d "${HOME}/.rvm/bin" ]]; then
  PATH="${HOME}/.rvm/bin:${PATH}"
fi

if [[ -f "${USR_LOCAL}/etc/bash_completion" ]]; then
  source "${USR_LOCAL}/etc/bash_completion"
fi

if [[ -f "${HOME}/.nvm/nvm.sh" ]]; then
  source "${HOME}/.nvm/nvm.sh"
fi

if [[ -f "${HOME}/.rvm/scripts/rvm" ]]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

if [[ -f "${HOME}/.bash/alias.sh" ]]; then
  source "${HOME}/.bash/alias.sh"
fi

if [[ -f "${HOME}/.bash/alias/docker.sh" ]]; then
  source "${HOME}/.bash/alias/docker.sh"
fi

if [[ -f "${HOME}/.bash/gpg.sh" ]]; then
  source "${HOME}/.bash/gpg.sh"
fi

if [[ -f "${HOME}/.bash/prompt.sh" ]]; then
  source "${HOME}/.bash/prompt.sh"
fi

if [[ -f "${HOME}/.bash/triton.sh" ]]; then
  source "${HOME}/.bash/triton.sh"
fi

if [[ -f "${HOME}/.bash/local.sh" ]]; then
  source "${HOME}/.bash/local.sh"
fi

if [[ -f "${HOME}/.iterm2_shell_integration.bash" ]]; then
  source "${HOME}/.iterm2_shell_integration.bash"
fi

if [[ -f "${HOME}/.dircolors" ]]; then
  eval "$(dircolors "${HOME}/.dircolors" 2> /dev/null)"
fi
