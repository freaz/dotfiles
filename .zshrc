# Set Language
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="freaz"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # Terminal
  zsh-syntax-highlighting
  history-substring-search
  # Git 
  git
  git-extras
  # Homebrew
  brew
  brew-cask
  # Ruby
  gem
  bundler
  rails
  # Nodejs
  node
  nvm
  # Docker
  docker
  docker-compose
  # Other
  heroku
 )

# User configuration

# Credentials
CREDENTIALS=$HOME/.credentials
[[ -f $CREDENTIALS ]] && source $CREDENTIALS

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# Aliases
alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
alias zshconfig='vim ~/.zshrc'
alias sublime=subl
alias s=subl
alias gpg-ls='gpg --list-secret-keys --keyid-format LONG'
alias npm-installed='npm list -g --depth=0'
alias 1password='eval $(op signin my)'
alias pretty-json='python -m json.tool'

# Docker Aliases
alias dm='docker-machine'
alias dm-reset="eval $(dm env -u)"
alias dc='docker-compose'
alias docker-clean-containers='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias docker-clean-images='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias docker-clean="docker-clean-containers; docker-clean-images"

# Docker functions
dm-activate () {
  eval "$(dm env $1)"
}

# Docker Services
alias docker-postgres='docker run --rm -it --name pg -p 5432:5432 -v ~/.docker-volumes/postgres_data:/var/lib/postgresql/data -d postgres'
alias docker-postgres-connect='docker run --rm -it --link pg postgres psql -h pg -U postgres'
alias docker-redis='docker run --rm -it --name redis -p 6379:6379 -v ~/.docker-volumes/redis_data:/data -d redis redis-server --appendonly yes'
alias docker-redis-connect='docker run --rm -it --link redis redis redis-cli -h redis'

# paths
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$(python3 -m site --user-base)/bin" # Python3 user base

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# rbenv
eval "$(rbenv init -)"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Google Cloud SDK
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

