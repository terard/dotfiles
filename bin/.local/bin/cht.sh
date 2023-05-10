#!/usr/bin/env bash

languages=$(echo "ruby rails javascript lua" | tr " " "\n")
core_utils=$(echo "find xargs sed awk tmux git" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "gimme: " query

if echo "$languages" | grep -qs $selected; then
  tmux split-window -p 42 -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -R"
else
  tmux split-window -p 42 -h bash -c "curl cht.sh/$selected~$query | less -R"
fi
