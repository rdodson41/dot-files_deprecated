#!/usr/bin/env bash

__git_alias()
{
  while [[ "${#}" -gt 0 ]]; do
    local alias="g${1}"
    local value="$(git config --get "alias.${1}")"
    eval "
      __git_wrap_git_${1}()
      {
        COMP_WORDS=(git ${value} \${COMP_WORDS[*]:1})
        COMP_LINE=\"git ${value}\${COMP_LINE:${#alias}}\"
        COMP_CWORD=\"\${#COMP_WORDS[*]}\"
        COMP_POINT=\"\${#COMP_LINE}\"
        __git_func_wrap __git_main
      }
    "
    alias "${alias}"="git ${value}"
    complete -o bashdefault -o default -o nospace -F "__git_wrap_git_${1}" "${alias}"
    shift
  done
}

__git_alias $(__git_aliases)
