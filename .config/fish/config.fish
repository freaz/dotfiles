# Set Language
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Setup paths
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.cargo/bin

# Credentials
set -l LOCAL_FISH $HOME/.local.fish
if test -f $LOCAL_FISH
  source $LOCAL_FISH
end

# Setup editor
set -x EDITOR vim

# Aliases
alias home="git --work-tree=$HOME --git-dir=$HOME/.files.git"
alias g=git
alias gpg-ls='gpg --list-secret-keys --keyid-format LONG'
alias pretty-json='python -m json.tool'
alias vim-plug-update='curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
alias gwip='git add -A; git rm (git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias code-resume='code (git df --name-only HEAD^)'
alias ts='node --disable-warning=ExperimentalWarning --experimental-strip-types --experimental-transform-types'

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH
