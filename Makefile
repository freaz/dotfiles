BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle
SUBLIME_CONF=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
VSCODE_CONF=~/Library/Application\ Support/Code/User

station: homebrew_packages fish $(VSCODE_CONF) $(SUBLIME_CONF)
server: apt_packages fish

$(BREW):
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

$(SUBLIME_CONF):
	ln -s ~/.sublime_config $(SUBLIME_CONF)

.PHONY: vscode_sync_extensions
vscode_sync_extensions: $(VSCODE_CONF)
	@sh -c "~/.vscode/sync-extensions.sh"

$(VSCODE_CONF):
	mkdir -p ${VSCODE_CONF}
	ln -s ~/.vscode/keybindingsMac.json ${VSCODE_CONF}/keybindings.json
	ln -s ~/.vscode/settings.json ${VSCODE_CONF}/settings.json
	ln -s ~/.vscode/snippets ${VSCODE_CONF}/snippets

.PHONY: fish
fish:
	@chsh -s $(shell which fish)
	@fish -c fisher

.PHONY: homebrew_packages
homebrew_packages: $(BREW_BUNDLE)
	brew bundle

.PHONY: apt_repositories
apt_repositories:
	sudo apt-add-repository ppa:fish-shell/release-3
	sudo apt-get update

.PHONY: apt_packages
apt_packages: apt_repositories
	sudo apt install fish curl vim git git-extras wget tmux python3 docker.io mosh

