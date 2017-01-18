#!/usr/bin/env bash

for profile in $(triton profiles -H -o name 2> /dev/null | grep --invert-match env); do
  alias "${profile}-exec"="TRITON_PROFILE=\"${profile}\" triton-profile-exec"
  complete -c "${profile}-exec"
done

unset profile
