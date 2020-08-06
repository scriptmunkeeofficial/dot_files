#!/bin/bash

# spliting the pane horizontaly in half
# selecting the new pane (right pane)
# resize panel 1 to 90 column wide
# spliting the right pane in veritcaly halves
# selecting pane 2 (lower right)
# resize pane 2 to 30 cells/rows high
# creating a new window with a name of 'Bash Some Shit'
# selecting the default window, Development
# selecting the main pane
# attaching to the running Tmux session

tmux new-session -A -d -n 'Development' -s 'Default' \; \
  split-window -h -p 5 \; \
  select-pane -t 1 \; \
  split-window -t 1 -v -p 30 \; \
  select-pane -t 2 \; \
  new-window -n 'Bash Some Shit' \; \
  select-window -t Development \; \
  select-pane -t 0 \; \
  attach-session -d \;

