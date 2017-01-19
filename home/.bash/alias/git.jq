(
  "alias \"g\(.)\"=\"git \\\"\(.)\\\"\"",
  "__git_wrap_git_\(.)()",
  "{",
  "  COMP_WORDS=(git $(git config --get \"alias.\(.)\") ${COMP_WORDS[*]:1})",
  "  COMP_CWORD=${#COMP_WORDS[*]}",
  "  COMP_LINE=\"git $(git config --get \"alias.\(.)\")${COMP_LINE:\(. | length + 1)}\"",
  "  COMP_POINT=${#COMP_LINE}",
  "  __git_func_wrap __git_main",
  "}",
  "complete -o bashdefault -o default -o nospace -F \"__git_wrap_git_\(.)\" \"g\(.)\""
)
