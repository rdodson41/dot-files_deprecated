#!/usr/bin/env bash

triton-profile-exec()
{
  (
    eval "$(triton env)"
    eval "${@}"
  )
}

complete -c triton-profile-exec
