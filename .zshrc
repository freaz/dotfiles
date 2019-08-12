# Set Language
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Set name of the theme to load.
ZSH_CUSTOM=~/.zsh
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
ZSH_THEME="freaz"

# Credentials
CREDENTIALS=$HOME/.credentials
[[ -f $CREDENTIALS ]] && source $CREDENTIALS


# Load and init antigen
if [[ ! -d ~/.zsh/antigen ]]; then
  git clone https://github.com/zsh-users/antigen.git ~/.zsh/antigen
fi

. ~/.zsh/antigen/antigen.zsh
antigen init ~/.antigenrc


# Setup paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH"
export PATH="$PATH:$(python3 -m site --user-base)/bin" # Python3 user base
export PATH="$PATH:$HOME/.cargo/bin" # rust binaries
[[ -e $HOME/.rbenv ]] && export PATH="$HOME/.rbenv/bin:$PATH"

# load z commmands
# . /usr/local/etc/profile.d/z.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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
alias dm-reset='eval "$(dm env -u)"'
alias dc='docker-compose'
alias dr='docker run --rm -it'
alias docker-clean-containers="docker ps -a | grep Exited | awk '{print $1}' | xargs docker rm"

# Docker functions
dm-activate() {
  eval "$(dm env $1)"
}

docker-rename-volume() {
  OLD_VOLUME=$1
  NEW_VOLUME=$2

  docker volume create --name $NEW_VOLUME
  docker run --rm -it -v $OLD_VOLUME:/from -v $NEW_VOLUME:/to alpine ash -c "cd /from ; cp -av . /to"
  docker volume rm $OLD_VOLUME
}

# Docker Services
alias docker-postgres='docker run --rm -it --name pg -p 5432:5432 -v ~/.docker-volumes/postgres_data:/var/lib/postgresql/data -d postgres'
alias docker-postgres-connect='docker run --rm -it --link pg postgres psql -h pg -U postgres'
alias docker-redis='docker run --rm -it --name redis -p 6379:6379 -v ~/.docker-volumes/redis_data:/data -d redis redis-server --appendonly yes'
alias docker-redis-connect='docker run --rm -it --link redis redis redis-cli -h redis'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# rbenv
eval "$(rbenv init -)"

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

