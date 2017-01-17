#!/usr/bin/env bash

alias -- ~="cd ~"
alias -- -="cd -"
alias -- ..="cd .."

alias ls="ls --classify --format=long --human-readable --time-style=long-iso --color=auto"
alias la="ls --almost-all"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias rgrep="rgrep --color=auto"

alias env-ssh="env | grep ^SSH | sort"
alias env-gpg="env | grep ^GPG | sort"
alias env-gem="env | grep ^GEM | sort"
alias env-rvm="env | grep ^rvm | sort"
alias env-nvm="env | grep ^NVM | sort"
alias env-sdc="env | grep ^SDC | sort"
alias env-triton="env | grep ^TRITON | sort"
alias env-docker="env | grep ^DOCKER | sort"

alias first="head --lines=1"

alias b="bundle"
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"

if which thefuck &> /dev/null; then
	eval "$(thefuck --alias)"
fi

alias x="exit"
