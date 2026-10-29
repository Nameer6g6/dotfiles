#!/bin/zsh

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
# macOS Terminal.app: no per-window history in $ZDOTDIR/.zsh_sessions, keep the one HISTFILE
export SHELL_SESSIONS_DISABLE=1
