#!/bin/sh

if [ -f ~/.local_shell_profile ]; then
  source ~/.local_shell_profile
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

################################################################################
# Alias options
################################################################################
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -alh'
alias vg='vagrant'
alias vgssh='vg ssh'
alias vgstatus='vg status'
alias term-width='tput cols'
alias term-height='tput lines'
alias ducks='du -cks * | sort -rn | head'
alias start-windows10='VBoxManage startvm "Windows10"'
alias logcat='adb logcat -v color'
alias cat='bat'
alias vi='vim'
alias weather='curl wttr.in'
alias docker-attach='eval $(docker-machine env default)'
alias audio-restart='sudo killall coreaudiod'
if [ -e ~/bin/tmux_default_session.sh ]; then
  alias tmux-default='~/bin/tmux_default_session.sh'
fi
alias ecr-tag-search='f() { aws ecr list-images --repository-name "$1" | jq -r --arg tag "$2" '"'"'.imageIds[] | select(.imageTag | contains($tag))'"'"'; }; f'


################################################################################
# Termainal Settings
################################################################################

# Shutting up MacOS Catalina because I like Bash
export BASH_SILENCE_DEPRECATION_WARNING=1
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'
export BAT_THEME='gruvbox-dark'
export EDITOR='vim'

# Homebrew Setup
eval "$(/opt/homebrew/bin/brew shellenv)"

# Starship Setup
eval "$(starship init bash)"

# Carapace Setup
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

# bash-completion
# [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# get current branch in git repo
function parse_git_branch {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    # echo " (${BRANCH}${STAT}) "
    echo " [ ${BRANCH}${STAT} ] "
  else
    echo ""
  fi }

# get current status of git repo
function parse_git_dirty {
  status=`git status 2>&1 | tee`
  dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
  untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
  ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
  newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
  renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
  deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
  bits=''
  if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
  fi
  if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
  fi
  if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
  fi
  if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
  fi
  if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
  fi
  if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
  fi
  if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/ncurses/lib/pkgconfig"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"

export FZF_DEFAULT_OPTS="
  --walker-skip=.git,node_modules,.nx,__pycache__,.pytest_cache,venv,.venv,.vim,.gradle,.nvim,.Trash,.cache,.next,coverage
  --tmux 80%
  --border --height=60% --margin=2%"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  "

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'
  "

# Adding git options from https://github.com/junegunn/fzf-git.sh
# User Ctrl+G ? to open help
source $HOME/tools/fzf-git.sh

# yazi config
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Prompt with Current directory
# export PS1="[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m]\$ "
# export PS1="[\[\e[36m\]\u\[\e[m\]: \[\e[33;1m\]\W\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "

# Prompt with Full Path
# export PS1="[\[\e[36m\]\u\[\e[m\]: \[\e[33;1m\]\w\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "
# export PS1="\n[\[\e[36m\]Ken\[\e[m\]: \[\e[33;1m\]\w\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "
# export PS1="\n[\[\e[34m\]Ken\[\e[m\]]: \[\e[32m\]\w\[\e[m\]\n\[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[32m\]<\[\e[m\]\[\e[32m\]>\[\e[m\] "
# export PS1="\n{\[\e[34m\]\u\[\e[m\]} \[\e[32m\]@\[\e[m\] {\[\e[34m\]\h\[\e[m\]}: \[\e[32m\]\w\[\e[m\]\n\[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[32m\]<\[\e[m\]\[\e[32m\]>\[\e[m\] "
# export PS1="\n\[\e[33;44m\] \w \[\e[m\]\[\e[34;43m\]\`parse_git_branch\`\[\e[m\]\n \[\e[33m\]\\$\[\e[m\] "
# export PS1="\n\[\e[30;47m\] \w \[\e[m\]\[\e[44m\]\`parse_git_branch\`\[\e[m\]\n \\$ "
# export PS1="\n\[\e[30;47m\][\h] \w \[\e[m\]\[\e[30;44m\]\`parse_git_branch\`\[\e[m\]\n \\$ "
# export PS1="\n\e[1;15m\]\[\e[48;5;240m\][\h] \w \[\e[38;5;242m\]\[\e[48;5;214m\]\`parse_git_branch\`\[\e[m\]\n \\$ "
# export PS1="\n\e[1;15m\]\[\e[48;5;240m\][\h] \w \[\e[38;5;15m\]\[\e[48;5;175m\]\e[1m\]\`parse_git_branch\`\[\e[m\]\n \\$ "
#export PS1="\[\e]12;#d3869b\a\]\n\e[1;15m\]\[\e[48;5;240m\][\h] \w \[\e[38;5;15m\]\[\e[48;5;175m\]\e[1m\]\`parse_git_branch\`\[\e[m\]\n\[\e[38;5;175m\] \\$> \[\e[m\]"


################################################################################
# Development Environment  Settings
################################################################################

export JAVA_HOME="$(/usr/libexec/java_home -v 21.0.9)"
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export ANDROID_SDK_HOME=$HOME/Library/Android/sdk
export M2_HOME=/opt/homebrew/Cellar/maven/3.9.9
export MAVEN_HOME=$M2_HOME

# Homebrew exports
# export LDFLAGS="-L$HOMEBREW_PREFIX/opt/ncurses/lib"
# export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/ncurses/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/libpq/lib/pkgconfig"

# # Python pyenv support
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH" && export PATH="$PYENV_ROOT/shims:$PATH"
# eval "$(pyenv init - bash)"

# Node nvm support
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :

################################################################################
# PATH Exports
################################################################################
export PATH=$HOME/bin:$HOME/dev/tools:$M2_HOME/bin:$JAVA_HOME/bin:$HOME/go/bin:$PATH
# export PATH=$ANDROID_HOME/platform-tools/bin:$ANDROID_HOME/tools:$PATH
export PATH=$HOME/.local/bin:$HOMEBREW_PREFIX/opt/libpq/bin:$PATH

