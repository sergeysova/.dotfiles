alias ll="ls -AlGhp --group-directories-first"
alias mk='mkdir -p'
alias scr='tm=$(date +"%F_%H%M%S_%s"); xwd -out screenshot-$tm.xwd -root -display :0.0 && convert screenshot-$tm.xwd screenshot-$tm.jpg; rm screenshot-$tm.xwd; echo "Created screenshot-$tm.jpg"'

# editor / viewer
alias s='sublime'
alias o='open'
alias c='cargo'
alias cc='ccat -G Comment="darkgreen" -G Keyword="teal" -G Plaintext="lightgray" -G Type="Blue" -G Punctuation="darkgray"'

# git
alias g='git'
alias gbr='git rev-parse --abbrev-ref HEAD'
alias gpull='git pull origin `gbr`'
alias gpush='git push origin `gbr`'
alias gorig='git config --get remote.origin.url'
alias go='git checkout '
alias ts='tig status'

alias npmr='npm run'
alias be='bundle exec'
alias jc='jq . '


if [ -f ~/.bash_include ]; then
  source ~/.bash_include
fi


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

function user_lst {
  if [ $(id -u) -eq 0 ]; then
    usrlst="★"
  else
    usrlst="❖"
  fi
}


function color_promt {
  local __user_name="\[\033[38;5;107m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]"
  local __user_host="\[$(tput sgr0)\]\[\033[38;5;38m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]"
  local __dir="\[$(tput sgr0)\]\[\033[38;5;144m\][\w\[$(tput sgr0)\]\[\033[38;5;150m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]"
  # local __lst="\\$\[$(tput sgr0)\]"
  local __lst="❖"
  if [ $(id -u) -eq 0 ]; then
    __lst="★"
  fi
  user_lst
  local __git_branch='\[\033[38;5;245m\]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  # export PS1="\n__user_name@$__user_host $__dir $__git_branch\[\033[38;5;15m\]\n$__lst "
  export PS1="$__user_host -> $__dir $__git_branch \[\033[38;5;8m\]<\t> \n${user_lst}$__user_name \[\033[38;5;8m\][\W] \[\033[38;5;15m\]$usrlst "
#  export PROMPT_COMMAND="printf \"\n\""
}

color_promt

# export PS2='WOWO'

# Make bash check its window size after a process completes
shopt -s checkwinsize

source ~/.dotfiles/git-completion.bash

