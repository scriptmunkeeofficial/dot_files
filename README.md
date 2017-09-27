# dot files
by _scriptmunkeeofficial_

To help me keep my dot files consistent across development machines/environments, I've created this repo. Everyone is free to use the dot files for their own personal enjoyment.

Once you've installed the dot files from this repo you'll have a Bash Shell ready for Ruby on Rails or Python or PHP development. TMUX & VIM will be visually insync using Airline & PowerLine themes

## What's available
* Vim dot rc file
* Tmux dot config
* Bash Profile

### bash_profile overview
#### Alias options
Directory Listing shorts
ls='ls -G'
ll='ls -l'
la='ls -a'

Vagrant 
vg='vagrant'
vgssh='vg ssh'
vgstatus='vg status'

#### Enviroment Variables
JAVA_HOME
ANDROID_HOME
ANDROID_SDK
M2_HOME
MAVEN_HOME

#### Terminal Settings
TERM="xterm-color"
CLICOLOR=1 
LSCOLORS=ExBxDxCxegedabagacad
GREP_OPTIONS='--color=auto'

#### Bash Prompt
Enable two line bash prompt with full directory path. Plus there is a commented out version that only uses the current directory

#### Git-VIM Support
You'll need this for Git-Vim support

### tmux.conf overview
#### Plugins
* nord
* tmux-battery
* tmux-cpu
* tmux-prefix-highlight
* tmux-themepack
* tmux-urlview
* tpm

### vimrc overview
#### Plugins
* CtrlP
* emmet
* fugitive
* nerdtree
* nord-vim
* tcomment
* tmuxline
* vim-airline
* vim-airline-themes
* vim-git
* vim-ruby
* vim-tumux-navigator

## Getting and Using dot files
Clone the Git repo

    git clone https://github.com/scriptmunkeeofficial/dot_files.git

## Install the dot files
### Automatically

Run setup.sh

```
cd [clone location]\dot_files
bash setup.sh
```

### Manually
1. Navigate to the `[clone location]\dot_files\files` directory
2. In the dot_files directory open the dot_* file with your favorite editor.
3. Copy the portions you want to your dot files _(i.e. .vimrc, .tmux_confi, .bash_profile)_
