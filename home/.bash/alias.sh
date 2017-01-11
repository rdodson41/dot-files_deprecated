#!/usr/bin/env bash

alias -- ~="cd ~"
alias -- -="cd -"
alias -- ..="cd .."

if ls --version &> /dev/null; then
	alias ls="ls --classify --format=long --human-readable --time-style=long-iso --color=auto"
else
	alias ls="ls -FGThl"
fi

alias l="ls"
alias la="ls -A"
alias lar="ls -AR"
alias lr="ls -R"
alias lra="ls -RA"

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

alias g="git"

for alias in $(git config --global --get-regexp "^alias[.]" | cut -d " " -f 1 | cut -d "." -f 2-); do
	alias "g${alias}"="git ${alias}"
done

alias b="bundle"
alias bi="bundle install"
alias bu="bundle update"
alias be="bundle exec"

for profile in $(triton profiles -H -o name 2> /dev/null | grep --invert-match env); do
  alias "${profile}"="TRITON_PROFILE=${profile} triton-profile-exec"
done

if which thefuck &> /dev/null; then
	eval "$(thefuck --alias)"
fi

alias x="exit"

unset alias
unset profile
