alias ll="ls -laFh"
alias mk='mkdir -p'

# editor / viewer
alias s='sublime'
alias o='open'

# git
alias g='git'
alias gbr='git rev-parse --abbrev-ref HEAD'
alias gpull='git pull origin `gbr`'
alias gorig='git config --get remote.origin.url'


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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

