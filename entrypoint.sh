#!/bin/sh

GPG_TTY="$(tty)"
export GPG_TTY

if [ "$1" = "ash" ]; then
  shift
  exec ash "$@"
else
  exec git "$@"
fi
