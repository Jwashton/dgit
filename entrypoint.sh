#!/bin/sh

GPG_TTY="$(tty)"
export GPG_TTY

exec git "$@"
