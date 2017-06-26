### GIT
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})%{$reset_color%}"

### NVM
ZSH_THEME_NVM_PROMPT_PREFIX="node:("
ZSH_THEME_NVM_PROMPT_SUFFIX=")"

function nvm_info() {
  echo "node:($(node --version | sed -e 's/v//'), $(npm --version))"
}

### RBENV
function ruby_version() {
  echo "ruby:($(rbenv version | sed -e "s/ (set.*$//"))" 
}

### HEROKU
function heroku_active_account() {
  echo "heroku:($(heroku accounts | sed -n '/^\*.*/p' | sed -e 's/^\* //'))"
}

function show_datetime() {
  echo "%{$fg_bold[green]%}[$(date +%Y-%m-%dT%H:%M:%S)]%{$reset_color%}"
}

PROMPT='$(show_datetime) %{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info) %B$%b%{$reset_color%} '
RPROMPT='$(nvm_info)'
