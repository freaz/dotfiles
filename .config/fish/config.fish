# Set Language
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Credentials
set CREDENTIALS $HOME/.credentials
#[[ -f $CREDENTIALS ]] && source $CREDENTIALS
if test -f $CREDENTIALS
  source $CREDENTIALS
end

# Setup paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Aliases
alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
alias sublime=subl
alias s=subl
alias gpg-ls='gpg --list-secret-keys --keyid-format LONG'
alias pretty-json='python -m json.tool'
alias vim-plug-update='curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Docker Aliases
alias dm='docker-machine'
alias dm-activate='eval (dm env $argv)'
alias dm-reset='eval (dm env -u)'
alias dc='docker-compose'
alias dr='docker run --rm -it'

# Docker Services
alias docker-postgres='docker run --rm -it --name pg -p 5432:5432 -v ~/.docker-volumes/postgres_data:/var/lib/postgresql/data -d postgres'
alias docker-postgres-connect='docker run --rm -it --link pg postgres psql -h pg -U postgres'
alias docker-redis='docker run --rm -it --name redis -p 6379:6379 -v ~/.docker-volumes/redis_data:/data -d redis redis-server --appendonly yes'
alias docker-redis-connect='docker run --rm -it --link redis redis redis-cli -h redis'

