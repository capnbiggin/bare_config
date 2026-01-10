#!/usr/bin/env bash

fzf_args=(
  --multi
  --preview 'tmux list-sessions'
  --preview-label='alt-p: toggle description, alt-j/k: scroll, tab: multi-select'
  --preview-label-pos='bottom'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --bind 'alt-k:preview-up,alt-j:preview-down'
  --color 'pointer:green,marker:green'
)

# tmux_ses=$(tmux list-sessions | awk -F':' '{print $1}' | fzf "${fzf_args[@]}")
tmux_ses=$(tmux list-sessions | fzf "${fzf_args[@]}")

if [[ -n "$tmux_ses" ]]; then
  echo "$tmux_ses" | awk -F':' '{print $1}' | xargs tmux kill-session -t
  source "../show-done.sh"
fi
