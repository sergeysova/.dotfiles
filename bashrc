alias ll="ls -laFGh"
alias mk='mkdir -p'

# editor / viewer
alias s='sublime'
alias o='open'

# git
alias g='git'
alias gbr='git rev-parse --abbrev-ref HEAD'
alias gpull='git pull origin `gbr`'
alias gpush='git push origin `gbr`'
alias gorig='git config --get remote.origin.url'
alias go='git checkout '
alias ts='tig status'


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
  export PS1="\n$__user_host -> $__dir $__git_branch \[\033[38;5;8m\]<\t> \n${user_lst}$__user_name \[\033[38;5;8m\][\W] \[\033[38;5;15m\]$usrlst "
}

color_promt

export PS2='WOWO'

# Make bash check its window size after a process completes
shopt -s checkwinsize

function te() {
  touch $@;
  vim $@;
}

function backup() {
  ext=".backup"
  for fil in "$@"
  do
    cp -r $fil "$fil$ext"
  done
}

function restore() {
  ext=".backup"
  for fil in "$@"
  do
    backup="$fil$ext"
    if [ -f $backup ];
    then
      if [ -f $fil ];
      then
        rm -rf $fil
      fi
      cp $backup $fil
    else
      echo "Backup file $fil$ext not found!"
    fi
  done
}

function dropbackup() {
  ext=".backup"
  for file in "$@"
  do
    backup="$file$ext"
    if [ -f $backup ]
    then
      rm -rf $backup
    fi
  done
}

function removebackups() {
  rm -rf *.backup
}

function disable() {
  ext=".backup"
  for file in "$@"
  do
    cp -r $file "$file$ext"
    rm -rf $file
  done
}

source ~/.dotfiles/git-completion.bash
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
