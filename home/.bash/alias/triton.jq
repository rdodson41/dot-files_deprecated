select(.name != "env") |
(
  "alias \"\(.name)-exec\"=\"TRITON_PROFILE=\\\"\(.name)\\\" triton-profile-exec\"",
  "complete -c \"\(.name)-exec\""
)
