# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Configure PowerLevel9K theme

function zsh_package_node() {
  local file=false

  if [[ -f ./package.json ]]; then
    file="./package.json"
  elif [[ -f ../package.json ]]; then
    file="../package.json"
  elif [[ -f ../../package.json ]]; then
    file="../../package.json"
  elif [[ -f ../../../package.json ]]; then
    file="../../../package.json"
  elif [[ -f ../../../package.json ]]; then
    file="../../../package.json"
  elif [[ -f ../../../../package.json ]]; then
    file="../../../../package.json"
  elif [[ -f ../../../../../package.json ]]; then
    file="../../../../../package.json"
  elif [[ -f ../../../../../../package.json ]]; then
    file="../../../../../../package.json"
  elif [[ -f ../../../../../../../package.json ]]; then
    file="../../../../../../../package.json"
  elif [[ -f ../../../../../../../../package.json ]]; then
    file="../../../../../../../../package.json"
  elif [[ -f ../../../../../../../../../package.json ]]; then
    file="../../../../../../../../../package.json"
  elif [[ -f ../../../../../../../../../../package.json ]]; then
    file="../../../../../../../../../../package.json"
  fi

  if [[ -f $file ]]; then
    local name=$(jq .name $file 2> /dev/null | sed -e 's/^"//' -e 's/"$//')
    local version=$(jq .version $file 2> /dev/null | sed -e 's/^"//' -e 's/"$//')

    if [[ name && version ]]; then
      echo -n "$name@$version"
    fi
  fi
}

POWERLEVEL9K_CUSTOM_PACKAGE_NODE="zsh_package_node"
POWERLEVEL9K_CUSTOM_PACKAGE_NODE_BACKGROUND="blue"
POWERLEVEL9K_CUSTOM_PACKAGE_NODE_FOREGROUND="white"

POWERLEVEL9K_NODE_VERSION_FOREGROUND="black"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs custom_package_node nvm) # node_version nvm
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
export TERM="xterm-256color"
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="powerline"
# POWERLINE_PATH="short"

# Hide user and host names
DEFAULT_USER="lestad"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
#  brew # bundled
#  rails
#  rvm
  nvm
  npm
  tig
#  rake
#  gem
  git-extras
#  github
  sudo
#  bundler
  command-not-found
#  git-hubflow
  common-aliases
  zsh-completions
  osx
#  zsh-wakatime
#  pip
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR='vim'

bindkey "^X\\x7f" backward-kill-line


alias g='git'
alias gbr='git rev-parse --abbrev-ref HEAD'
alias gpull='git pull origin `gbr`'
alias gpush='git push origin `gbr`'
alias gorig='git config --get remote.origin.url'
alias ggc='git fsck && git gc --prune=all'
alias ts='tig status'

alias npmr='npm run'

alias ll="exa -lah --group-directories-first --git"
alias lsd="lll"
alias lll="ls -AlGhp"
alias l="ll"
alias mk='mkdir -p'
alias usedall='du -sh .[!.]* *'
alias used='du -sh * *'


alias -s rb=vim

