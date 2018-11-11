### GIT
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})%{$reset_color%}"

### NodejS
function nvm_info() {
  echo "node:($(node --version | sed -e 's/v//'), $(npm --version))"
}

### Docker
function docker_info() {
  ACTIVE_DM=$(dm active 2>&1)

  if [ "$ACTIVE_DM" == "No active host found" ]; then
    ACTIVE_DM="local"
  fi

  echo "docker:($ACTIVE_DM)"
}

### RBENV
function ruby_version() {
  echo "ruby:($(rbenv version | sed -e "s/ (set.*$//"))" 
}

### HEROKU
function heroku_active_account() {
  echo "heroku:($(heroku accounts | sed -n '/^\*.*/p' | sed -e 's/^\* //'))"
}

### Utils

function show_datetime() {
  echo "%{$fg_bold[green]%}[$(date +%Y-%m-%dT%H:%M:%S)]%{$reset_color%}"
}

PROMPT='%{$bg[green]$fg[black]%} %c %{$reset_color%}$(git_prompt_info) %B$%b%{$reset_color%} '
RPROMPT='$(docker_info) $(nvm_info) $(ruby_version)'
