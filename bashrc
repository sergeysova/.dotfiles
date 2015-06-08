alias ll="ls -laFh"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function color_promt {
  local __user_host="\[\033[38;5;107m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;38m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]"
  local __dir="\[$(tput sgr0)\]\[\033[38;5;144m\][\w\[$(tput sgr0)\]\[\033[38;5;150m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]"
  local __lst="\\$\[$(tput sgr0)\]"
  local __git_branch='\[\033[38;5;245m\]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  export PS1="$__user_host $__dir $__git_branch\[\033[38;5;15m\]$__lst "
}

color_promt

# Make bash check its window size after a process completes
shopt -s checkwinsize

export NVM_DIR="/Users/lestad/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
