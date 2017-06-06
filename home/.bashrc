#!/usr/bin/env bash

if [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
fi

if [[ -d "/usr/local/opt/coreutils/libexec/gnuman" ]]; then
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"
fi

if [[ -d "${HOME}/Developer/go" ]]; then
  export GOPATH="${HOME}/Developer/go"
fi

export GPG_TTY="$(tty)"

if [[ -f "/usr/local/etc/bash_completion" ]]; then
  source "/usr/local/etc/bash_completion"
fi

if [[ -f "${HOME}/.iterm2_shell_integration.bash" ]]; then
  source "${HOME}/.iterm2_shell_integration.bash"
fi

if [[ -f "${HOME}/.nvm/nvm.sh" ]]; then
  source "${HOME}/.nvm/nvm.sh"
fi

if [[ -f "${HOME}/.rvm/scripts/rvm" ]]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

eval "$(find "${HOME}/.bash" -type f -name *.sh -printf "source \"%p\"\n" 2> /dev/null)"

if [[ -f "${HOME}/.dircolors" ]]; then
  eval "$(dircolors "${HOME}/.dircolors" 2> /dev/null)"
fi
