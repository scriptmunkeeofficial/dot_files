# dot files
by _scriptmunkeeofficial_

To help me keep my dot files consistent across development machines/environments, I've created this repo. Everyone is free to use the dot files for their own personal enjoyment.

Once you've installed the dot files from this repo you'll have a Bash Shell ready for Ruby on Rails or Python or PHP development. TMUX & VIM will be visually in sync using Airline & PowerLine themes

## What's available
* .bash_profile
* .vimrc
* .tmux.conf

### Bash_Profile
#### Alias options
Directory Listing shorts*

* ls='ls -G'
* ll='ls -l'
* la='ls -a'

#### Vagrant

* vg='vagrant'
* vgssh='vg ssh'
* vgstatus='vg status'

#### Environment Variables
For the Java & Android developers, here are the standard needed environment variables being set.

* JAVA_HOME
* ANDROID_HOME
* ANDROID_SDK
* M2_HOME
* MAVEN_HOME

#### Terminal Settings
Enabling color support within Bash and Grep

* TERM="xterm-color"
* CLICOLOR=1 
* LSCOLORS=ExBxDxCxegedabagacad
* GREP_OPTIONS='--color=auto'

#### Prompt
Setting a two line bash prompt with the full directory path.

***Bonus:*** There is a commented out version that only uses the `Current Directory` name

#### Git Support in the Shell
You'll need this for some Git goodness in the shell. ;-)

### Tmux.conf
#### Plugins
* nord
* tmux-battery
* tmux-cpu
* tmux-prefix-highlight
* tmux-themepack
* tmux-urlview
* tpm

#### Tmux Default layout
I've included a shell script that will start Tmux with a default 3 Pane layout and 2 Windows.

<< insert screenshot >>

When the setup.sh script is run, this file is copied to `$HOME/bin` and an alias created called `tmux-default`. Execute `tmux-default` from your terminal to make the magic happen.

### Vimrc
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
