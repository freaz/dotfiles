# Set Language
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Setup paths
set -x PATH /usr/local/sbin $PATH

# Credentials
set -l LOCAL_FISH $HOME/.local.fish
if test -f $LOCAL_FISH
  source $LOCAL_FISH
end

# Aliases
alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
alias g=git
alias sublime=subl
alias s=subl
alias gpg-ls='gpg --list-secret-keys --keyid-format LONG'
alias pretty-json='python -m json.tool'
alias vim-plug-update='curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
alias gwip='git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

# Docker Aliases
alias dm='docker-machine'
alias dm-activate='eval (dm env $argv)'
alias dm-reset='eval (dm env -u)'
alias dc='docker-compose'
alias dr='docker run --rm -it'

