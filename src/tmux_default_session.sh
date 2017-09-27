#!/bin/bash

tmux new-session -A -d -n 'Development' -s 'Default'
tmux split-window -h -p 30 # spliting with 30% of the horizontal screen
tmux selectp -t 1
tmux split-window -v -p 40 # splititng window with 40% of the vertical screen of pane 1 (the right pane)
tmux new-window -n 'Bash Some Shit'
tmux selectw -t Development
tmux selectp -t 0
tmux attach-session -d
