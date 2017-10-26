#!/bin/sh

# Alias options
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias vg='vagrant'
alias vgssh='vg ssh'
alias vgstatus='vg status'
alias term-width='tput cols'
alias term-height='tput lines'

# Replacing the default tmux command to run a custom session
if [ -e ~/bin/tmux_default_session.sh ]
then
  alias tmux-default='~/bin/tmux_default_session.sh'
fi

# Development Environment  Settings
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_HOME=$HOME/Library/Android/sdk
export M2_HOME=$HOME/dev/tools/apache-maven-3.3.9
export MAVEN_HOME=$M2_HOME

# Termainal Settings
# export PS1="[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m]\$ "
export TERM="xterm-color"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'

# Environment Settings
export PATH=$HOME/bin:$M2_HOME/bin:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$HOME/.rvm/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Prompt with Current directory
#export PS1="[\[\e[36m\]\u\[\e[m\]: \[\e[33;1m\]\W\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "

# Prompt with Full Path
export PS1="[\[\e[36m\]\u\[\e[m\]: \[\e[33;1m\]\w\[\e[m\]]\\n\[\e[32m\]\`parse_git_branch\`\[\e[m\]\$ "

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "(${BRANCH}${STAT})"
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

