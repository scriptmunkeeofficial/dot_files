# dot files
by _scriptmunkeeofficial_

To help me keep my dot files consistent across development machines/environments, I've created this repo. Everyone is free to use the dot files for their own personal enjoyment.

Once you've installed the dot files from this repo you'll have a Bash Shell ready for Ruby on Rails or Python or PHP development. TMUX & VIM will be visually in sync using Airline & PowerLine themes

## What's available
### Dot Files
* .bash_profile
* .vimrc
* .tmux.conf

### Environment Setup
* Replace or Append dot files
* Install necessary fonts
	* Powerline Fonts can be gotten from [Github](https://github.com/powerline/fonts)
	* Font used is [Source Code Pro](https://github.com/powerline/fonts/tree/master/SourceCodePro) & [Anonymous Pro](https://github.com/powerline/fonts/tree/master/AnonymousPro)
	* [Powerline OS X Install Guide](https://powerline.readthedocs.io/en/latest/installation/osx.html)
	* Nerd Fonts
		* [Anonymice Pro](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/AnonymousPro.zip)
		* [LiterationMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/LiberationMono.zip)
		* [3270 Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/3270.zip)

* Install [iTerm2](https://www.iterm2.com/) for Max OS X
	* Set iTerm2 to use the **Source Code Pro** font

	![iTerm2 Font Config](https://github.com/scriptmunkeeofficial/dot_files/blob/master/resources/iterm2-fonts.png)
	
* Application Themes
	* Nord
		* [Nord for iTerm](https://github.com/arcticicestudio/nord-iterm2)
		* [Nord for Vim](https://github.com/arcticicestudio/nord-vim)
		* [Nord for Tmux](https://github.com/arcticicestudio/nord-tmux)
	* Hybrid
		* [iTerm](https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors)
		* [Vim](https://github.com/w0ng/vim-hybrid)

* System Requirements
  * [Brew](https://brew.sh/) 
    * urlview
    * tmux
    * reattach-to-user-namespace

### Bash_Profile
#### Alias options
* ls='ls -G'
* ll='ls -l'
* la='ls -a'
* term-width='tput cols'
* term-height='tput lines'

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
* [tpm](https://github.com/tmux-plugins/tpm)
* [tmux-battery](https://github.com/tmux-plugins/tmux-battery)
* [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu)
* [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)
* [tmux-themepack](https://github.com/jimeh/tmux-themepack)
* [tmux-urlview](https://github.com/tmux-plugins/tmux-urlview)
* [tmux-themepack](https://github.com/jimeh/tmux-themepack.git)
* [nord](https://github.com/arcticicestudio/nord-iterm2)

[add screenshot here]

#### Tmux Default layout
I've included a shell script that will start Tmux with a default 3 Pane layout and 2 Windows.

![Tmux-Default](https://github.com/scriptmunkeeofficial/dot_files/blob/master/resources/tmux_powered.png)

When the setup.sh script is run, this file is copied to `$HOME/bin` and an alias created called `tmux-default`. Execute `tmux-default` from your terminal to make the magic happen.

### Vimrc
#### Plugins
* [CtrlP](https://github.com/kien/ctrlp.vim)
* [emmet](https://github.com/mattn/emmet-vim)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [lightline](https://github.com/itchyny/lightline.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree.git)
* [nord-vim](https://github.com/arcticicestudio/nord-vim)
* [tcomment](https://github.com/tomtom/tcomment_vim)
* [tmuxline](https://github.com/edkolev/tmuxline.vim)
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* -vim-git-
* [vim-hybrid](https://github.com/w0ng/vim-hybrid)
* [vim-log-syntax](https://github.com/dzeban/vim-log-syntax)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [vim-tmux](https://github.com/tmux-plugins/vim-tmux)
* [vim-tumux-navigator](https://github.com/christoomey/vim-tmux-navigator)

<<make this a screenshot>>
>$HOME/.vim/bundle/
>├── ctrlp
>├── emmet-vim
>├── lightline.vim
>├── nerdtree
>├── nord-vim
>├── tcomment_vim
>├── tmuxline.vim
>├── vim-airline
>├── vim-airline-themes
>├── vim-fugitive
>├── vim-git
>├── vim-hybrid
>├── vim-log-syntax
>├── vim-ruby
>├── vim-tmux
>└── vim-tmux-navigator

## Getting and Using dot files
Clone the Git repo

    git clone https://github.com/scriptmunkeeofficial/dot_files.git

## Install the dot files
### Automatically

Run setup.sh [ eventually, but until then just copy them accordingly ]

```
cd [clone location]\dot_files
bash setup.sh
```

### Manually
1. Navigate to the `[clone location]\dot_files\files` directory
2. In the dot_files directory open the dot_* file with your favorite editor.
3. Copy the portions you want to your dot files _(i.e. .vimrc, .tmux_confi, .bash_profile)_

