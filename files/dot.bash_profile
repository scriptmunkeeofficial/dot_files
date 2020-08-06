#!/bin/sh

# Alias options
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -a'
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
alias web-timer='curl -s -w '\''Testing Response Time (seconds) for: %{url_effective}\n\nLookup Time:\t\t%{time_namelookup}\nConnect Time:\t\t%{time_connect}\nPre-transfer Time:\t%{time_pretransfer}\nStart-transfer Time:\t%{time_starttransfer}\n\nTotal Time:\t\t%{time_total}\n'\'' -o /dev/null'

# Replacing the default tmux command to run a custom session
if [ -e ~/bin/tmux_default_session.sh ]
then
  alias tmux-default='~/bin/tmux_default_session.sh'
fi

# Shutting up MacOS Catalina because I like Bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# Development Environment  Settings
export JAVA_HOME="$(/usr/libexec/java_home -v 11.0.5)"
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_HOME=$HOME/Library/Android/sdk
export M2_HOME=$HOME/dev/tools/apache-maven-3.5.3
export MAVEN_HOME=$M2_HOME

# From HOMEBREW
export HOMEBREW_GITHUB_API_TOKEN="f00d3d11192427d74f505c73b5c8ef7174a83ceb"
#For compilers to find ncurses you may need to set:
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"
#For pkg-config to find ncurses you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"


# Termainal Settings
#export TERM="xterm-color"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'

export SOURCE_HOME=$HOME/dev/src/platform

# Environment Settings
export PATH=$HOME/bin:$HOME/dev/tools:$M2_HOME/bin:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$HOME/.rvm/bin:/usr/local/opt/ncurses/bin:$PATH

# bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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

# Prompt with Current directory
# export PS1="[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m]\$ "
# export PS1="[\[\e[36m\]\u\[\e[m\]: \[\e[33;1m\]\W\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "

# Prompt with Full Path
# export PS1="[\[\e[36m\]\u\[\e[m\]: \[\e[33;1m\]\w\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "
# export PS1="\n[\[\e[36m\]Ken\[\e[m\]: \[\e[33;1m\]\w\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "
# export PS1="\n[\[\e[34m\]Ken\[\e[m\]]: \[\e[32m\]\w\[\e[m\]\n\[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[32m\]<\[\e[m\]\[\e[32m\]>\[\e[m\] "
# export PS1="\n{\[\e[34m\]\u\[\e[m\]} \[\e[32m\]@\[\e[m\] {\[\e[34m\]\h\[\e[m\]}: \[\e[32m\]\w\[\e[m\]\n\[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[32m\]<\[\e[m\]\[\e[32m\]>\[\e[m\] "
# export PS1="\n\[\e[33;44m\] \w \[\e[m\]\[\e[34;43m\]\`parse_git_branch\`\[\e[m\]\n \[\e[33m\]\\$\[\e[m\] "
export PS1="\n\[\e[30;47m\] \w \[\e[m\]\[\e[44m\]\`parse_git_branch\`\[\e[m\]\n \\$ "

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

