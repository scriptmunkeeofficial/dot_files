#!/bin/sh

###############################################################################
# Initialization Check
###############################################################################

# check if Homebrew is installed
if ! command -v brew 2>&1 >/dev/null; then
  echo 'Homebrew not install, so lets get that installed first'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###############################################################################
# Install base applications
###############################################################################

brew tap universal-ctags/universal-ctags
brew install tmux urlview reattach-to-user-namespace sqlite vim wget svn bat bash-completion yazi fzf ffmpeg the_silver_searcher zoxide
brew install --HEAD universal-ctags
brew install --cask visual-studio-code macvim orbstack tableplus discord raycask rectangle disk-inventroy-x

###############################################################################
# Install Fonts
###############################################################################

brew tap homebrew/cask-fonts
brew install --cask font-source-code-pro-for-powerline font-anonymous-pro font-liberation-nerd-font font-3270-nerd-font font-anonymice-nerd-font font-menlo-for-powerline

# No longer needed, but will leave for prosperity
# if [ ! -d fonts ]; then
#   mkdir fonts
# fi

# cd fonts
# git clone https://github.com/powerline/fonts.git --depth=1 powerline-fonts
# cd powerline-fonts
# ./install.sh
#
# cd ../../


###############################################################################
# iTerm2 Setup
###############################################################################

if [ ! -d themes ]; then
  mkdir themes
fi

cd themes
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Hybrid.itermcolors -o Hybrid.itermcolors
curl https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/nord.itermcolors -o nord.itermcolors
cd ../

###############################################################################
# VIM Setup
###############################################################################

current_path=$(pwd)
echo "Current Path is: $current_paht"

if [ ! -d !/.vim/autoload ] ; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
else
    echo 'WARNING: .vim folder already exists'
fi

# simlink dot.vimrc to ~/.vimrc
if [ ! -f ~/.vimrc ] || [ ! -L ~/.vimrc ] ; then
    ln -s $current_path/files/dot.vimrc ~/.vimrc
else
    echo 'WARNING: .vimrc already exists'
fi

# insalling Vim plugins
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

# install Coc Extensions
vim -c "CocInstall -sync coc-json coc-html coc-tsserver coc-phpls coc-python coc-git coc-eslint coc-sql coc-xml coc-yaml |qall"

###############################################################################
# Tmux Setup
###############################################################################

# clone all the necessary Git repos
if [ ! -d ~/.tmux/plugins ] ; then
  mkdir -p ~/.tmux/plugins
fi

# simlink dot.tmux.conf to ~/.tmux.conf
if [ ! -f ~/.tmux.conf ] || [ ! -L ~/.tmux.conf ] ; then
      ln -s $current_path/files/dot.tmux.conf ~/.tmux.conf
else
    echo 'WARNING: .tmux.conf already exists'
fi

# install tpm
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

# simlink theme file
if [ ! -f ~/.tmux/tmuxline.theme ] ; then
      ln -s $current_path/files/tmuxline.theme ~/.tmux/
else
    echo 'WARNING: .tmux.conf already exists'
fi

# Adding Tmux Default Sessions to the PATH
if [ ! -d ~/bin ] ; then
  mkdir ~/bin
fi

ln -s $current_path/src/tmux_default_session.sh ~/bin/
ln -s $current_path/src/tmux-7-dwarfs.sh ~/bin/

###############################################################################
# Bash Setup
###############################################################################

if [ ! -f ~/.bash_profile ]; then
    ln -s $current_path/files/dot.bash_profile ~/.bash_profile
else
    'WARNING: .bash_profile already exists'
fi

if [ ! -f ~/.local_shell_profile ] || [ ! -L ~/.local_shell_profile ] ; then
  touch ~/.local_shell_profile

  cat <<'EOF' >> ~/.local_shell_profile
#!/bin/sh

# Local shell profile settings
echo "Add your personal shell profile attributes here" # <--- delete this line


################################################################################
# Aliases
################################################################################


################################################################################
# Environment Variables
################################################################################


################################################################################
# PATH Additions
################################################################################


EOF

else
  echo '~/.local_shell_profile already exists'
fi
