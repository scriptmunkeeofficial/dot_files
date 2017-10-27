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

# Need to check for Tmux TPM
  # https://github.com/tmux-plugins/tpm
  # mkdir -p ~/.tmux/plugins
  # git clone https://github.com/tmux-plugins/tpm

###############################################################################
# For VIM
###############################################################################

# clone all the necessary Git repos
# https://github.com/tpope/vim-pathogen
# Install options without Git cloning & a copy
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

/Users/scriptmunkee/.vim/bundle/
├── ctrlp
├── emmet
├── fugitive
├── nerdtree
├── nord-vim
├── tcomment_vim
├── tmuxline
├── vim-airline
├── vim-airline-themes
├── vim-git
├── vim-ruby
└── vim-tmux-navigator
# simlink dot.vimrc to ~/.vimrc

###############################################################################
# For Tmux
###############################################################################

/Users/scriptmunkee/.tmux/plugins/
├── nord-tmux
├── tmux-battery
├── tmux-cpu
├── tmux-prefix-highlight
├── tmux-themepack
├── tmux-urlview
└── tpm
# clone all the necessary Git repos
if [ ! -d ~/.tmux/plugins ] ; then
  mkdir -p ~/.tmux/plugins
fi

cd ~/.tmux/plugins/
git clone git@github.com:tmux-plugins/tpm
git clone git@github.com:tmux-plugins/tmux-battery
git clone git@github.com:tmux-plugins/tmux-cpu
git clone git@github.com:tmux-plugins/tmux-prefix-highlight
git clone git@github.com:tmux-plugins/tmux-urlview
git clone git@github.com:jimeh/tmux-themepack
git clone git@github.com:arcticicestudio/nord-tmux

# simlink dot.tmux.conf to ~/.tmux.conf

###############################################################################
# For Bash
###############################################################################

# append or replace .bash_profile
# I might want to move the org & create an simlink to the dot.bash_profile file
