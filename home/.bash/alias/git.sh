#!/usr/bin/env bash

__git_complete_alias()
{
  local alias="g${1}"
  local words=(git $(git config --get "alias.${1}"))
  local value="${words[*]}"
  eval "
    __git_wrap_git_${1}()
    {
      COMP_WORDS=(${words[*]} \${COMP_WORDS[*]:1})
      (( COMP_CWORD += $(( ${#words[*]} - 1 )) ))
      COMP_LINE=\"${value}\${COMP_LINE:${#alias}}\"
      (( COMP_POINT += $(( ${#value} - ${#alias} )) ))
      __git_func_wrap __git_main
    }
  "
  complete -o bashdefault -o default -o nospace -F "__git_wrap_git_${1}" "${alias}"
}

for alias in $(__git_aliases); do
	alias "g${alias}"="git ${alias}"
  __git_complete_alias "${alias}"
done

unset alias
