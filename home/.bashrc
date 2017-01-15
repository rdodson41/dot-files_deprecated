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

if [[ -f "${USR_LOCAL}/etc/bash_completion" ]]; then
  source "${USR_LOCAL}/etc/bash_completion"
fi

if [[ -f "${HOME}/.nvm/nvm.sh" ]]; then
  source "${HOME}/.nvm/nvm.sh"
fi

if [[ -f "${HOME}/.rvm/scripts/rvm" ]]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

for path in $(find "${HOME}/.bash" -type f -name *.sh); do
  source "${path}"
done

if [[ -f "${HOME}/.dircolors" ]]; then
  eval "$(dircolors "${HOME}/.dircolors" 2> /dev/null)"
fi

unset path
