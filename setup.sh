#!/bin/sh

###############################################################################
# System Check
###############################################################################

# on OS X need to check for Brew
# need to check for Git support
# need to check for an existing .vimrc
# need to check for an existing .vim directory & necessary directories
# need to check for an existing .tmux.conf
# need to check for an existing .tmux/plugins directory
# need to check for pathogen.vim in $HOME/.vim/autoload
# https://github.com/tpope/vim-pathogen
  # Install options without Git cloning & a copy
  # mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  # curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


###############################################################################
# For VIM
###############################################################################

# clone all the necessary Git repos

# simlink dot.vimrc to ~/.vimrc

###############################################################################
# For Tmux
###############################################################################

# clone all the necessary Git repos

# simlink dot.tmux.conf to ~/.tmux.conf

###############################################################################
# For Bash
###############################################################################

# append or replace .bash_profile
# I might want to move the org & create an simlink to the dot.bash_profile file
