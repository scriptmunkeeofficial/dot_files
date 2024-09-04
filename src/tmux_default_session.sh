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
  split-window -h -l 6% \; \
  select-pane -t 1 \; \
  split-window -t 1 -v -l 35 \; \
  select-pane -t 2 \; \
  new-window -n 'Bash Some Shit' \; \
  new-window -n 'Extra Shizzz' \; \
  select-window -t Development \; \
  attach-session -d \; \
  select-pane -t 0 \;

