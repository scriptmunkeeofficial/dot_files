#!/bin/bash

tmux new-window -d -n '7 Dwarfs' # 'ssh piqa-1'
tmux selectw -t '7 Dwarfs'
tmux split-window -v  # vertical half
tmux selectp -t 0
tmux split-window -h  # horizontal half
tmux split-window -h  # horizontal half
tmux selectp -t 0
tmux split-window -h  # horizontal half
tmux selectp -t 4
tmux split-window -h -p 33  # horizontal 30%
tmux selectp -t 4
tmux split-window -h  # horizontal half
tmux selectp -t 0
tmux set sync on
