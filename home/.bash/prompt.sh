#!/usr/bin/env bash

ruby-version-color()
{
	printf "\e[0;1;38;5;1m"
}

ruby-version()
{
	if [[ -n "${rvm_ruby_string}" ]]; then
		echo " [${rvm_ruby_string}]"
	fi
}

triton-profile-color()
{
	printf "\e[0;1;38;5;9m"
}

triton-profile()
{
	if [[ -n "${TRITON_PROFILE}" ]]; then
		echo " [${TRITON_PROFILE}]"
	fi
}

git-branch-color()
{
	local git_branch_color="\e[0;1;38;5;2m"
	local git_branch="$(git symbolic-ref --quiet --short HEAD 2> /dev/null)"
	if [[ -n "${git_branch}" ]]; then
		local git_branch_upstream="$(git rev-parse --quiet --abbrev-ref "${git_branch}@{upstream}" 2> /dev/null)"
		if [[ -n "${git_branch_upstream}" ]]; then
			local git_remote="$(git config --local --get "branch.${git_branch}.remote" 2> /dev/null)"
			if [[ -n "${git_remote}" ]]; then
				local git_remote_head="$(git symbolic-ref --quiet --short "refs/remotes/${git_remote}/HEAD" 2> /dev/null)"
				if [[ -n "${git_remote_head}" && "${git_branch_upstream}" == "${git_remote_head}" ]]; then
					git_branch_color="\e[0;1;38;5;1m"
				fi
			fi
		fi
	fi
	printf "${git_branch_color}"
}

git-branch()
{
	local git_branch="$(git symbolic-ref --quiet --short HEAD 2> /dev/null)"
	if [[ -n "${git_branch}" ]]; then
		echo " [${git_branch}]"
	fi
}

git-status-color()
{
	printf "\e[0;1;38;5;1m"
}

git-status()
{
	if [[ "$(git diff --quiet --staged 2> /dev/null; echo "${?}")" = 1 ]]; then
		echo " [+]"
	elif [[ "$(git diff --quiet 2> /dev/null; echo "${?}")" = 1 ]]; then
		echo " [!]"
	elif [[ -n "$(git ls-files --exclude-standard --others 2> /dev/null)" ]]; then
		echo " [?]"
	fi
}

if [[ "${USER}" == "root" ]]; then
	PS1="\[\e[0;1;38;5;1m\]\u"
else
	PS1="\[\e[0;1;38;5;3m\]\u"
fi

PS1="${PS1}\[\e[0m\]@"

if [[ -n "${SSH_TTY}" ]]; then
	PS1="${PS1}\[\e[0;1;38;5;1m\]\h"
else
	PS1="${PS1}\[\e[0;1;38;5;3m\]\h"
fi

PS1="${PS1}\[\e[0m\]:"
PS1="${PS1}\[\e[0;1;38;5;4m\]\w"
PS1="${PS1}\[\$(ruby-version-color)\]\$(ruby-version)"
PS1="${PS1}\[\$(triton-profile-color)\]\$(triton-profile)"
PS1="${PS1}\[\$(git-branch-color)\]\$(git-branch)"
PS1="${PS1}\[\$(git-status-color)\]\$(git-status)"

if [[ "${USER}" == "root" ]]; then
	PS1="${PS1}\[\e[0m\] # "
else
	PS1="${PS1}\[\e[0m\] \$ "
fi
