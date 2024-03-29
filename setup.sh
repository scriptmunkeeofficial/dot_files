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

brew tap universal-ctags/universal-ctags
brew install tmux urlview reattach-to-user-namespace sqlite vim wget svn bat bash-completion
brew install --HEAD universal-ctags
brew install --cask visual-studio-code macvim docker

###############################################################################
# For Fonts
###############################################################################

brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro-for-powerline font-anonymous-pro font-liberation-nerd-font font-3270-nerd-font font-anonymice-nerd-font

if [ ! -d fonts ]; then
  mkdir fonts
fi

cd fonts
git clone https://github.com/powerline/fonts.git powerilne-fonts
cd powerline-fonts
./install.sh

cd ../../


###############################################################################
# For iTerm2
###############################################################################

if [ ! -d themes ]; then
  mkdir themes
fi

cd themes
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Hybrid.itermcolors -o Hybrid.itermcolors
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/nord.itermcolors -o nord.itermcolors
cd ../

###############################################################################
# For VIM
###############################################################################

current_path=$(pwd)
echo "Current Path is: $current_paht"

# clone all the necessary Git repos
# https://github.com/tpope/vim-pathogen
# Install options without Git cloning & a copy
if [ ! -d !/.vim/autoload ] ; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
else
    echo 'WARNING: .vim folder already exists'
fi

# Setting up Vim plugin manager/loader Pathogen
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Getting Plugins from Github
#cd ~/.vim/bundle
#git clone https://github.com/tmux-plugins/vim-tmux.git
#git clone https://github.com/dzeban/vim-log-syntax.git
#git clone https://github.com/edkolev/tmuxline.vim.git
#git clone https://github.com/itchyny/lightline.vim.git

#ln -s $current_path/vim-hybrid/colors/hybrid.vim ~/.vim/colors/

# simlink dot.vimrc to ~/.vimrc
if [ ! -f ~/.vimrc ] || [ ! -L ~/.vimrc ] ; then
    ln -s $current_path/files/dot.vimrc ~/.vimrc
else
    echo 'WARNING: .vimrc already exists'
fi

###############################################################################
# For Tmux
###############################################################################

# clone all the necessary Git repos
if [ ! -d ~/.tmux/plugins ] ; then
  mkdir -p ~/.tmux/plugins
fi

cd ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm.git
git clone https://github.com/tmux-plugins/tmux-battery.git
git clone https://github.com/tmux-plugins/tmux-cpu.git
git clone https://github.com/tmux-plugins/tmux-prefix-highlight.git
git clone https://github.com/tmux-plugins/tmux-urlview.git
git clone https://github.com/jimeh/tmux-themepack.git
git clone https://github.com/arcticicestudio/nord-tmux.git

cd ~/

# simlink dot.tmux.conf to ~/.tmux.conf
if [ ! -f ~/.tmux.conf ] || [ ! -L ~/.tmux.conf ] ; then
      ln -s $current_path/files/dot.tmux.conf ~/.tmux.conf
else
    echo 'WARNING: .tmux.conf already exists'
fi

if [ ! -f ~/.tmux/tmuxline.theme ] ; then
      ln -s $current_path/files/tmuxline.theme ~/.tmux/
else
    echo 'WARNING: .tmux.conf already exists'
fi

# Adding Tmux Default Session to the PATH
if [ ! -d ~/bin ] ; then
  mkdir ~/bin
fi

ln -s $current_path/src/tmux_default_session.sh ~/bin/
ln -s $current_path/src/tmux-7-dwarfs.sh ~/bin/

###############################################################################
# For Bash
###############################################################################

# append or replace .bash_profile
# I might want to move the org & create an simlink to the dot.bash_profile file

if [ ! -f ~/.bash_profile ] || [ ! -L ~/.bash_profile ] ; then
    ln -s $current_path/files/dot.bash_profile ~/.bash_profile
else
    'WARNING: .bash_profile already exists'
fi

