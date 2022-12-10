BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle
VSCODE_CONF=~/Library/Application\ Support/Code/User
GPG_AGENT=~/.gnupg/gpg-agent.conf

station: homebrew_packages fish $(VSCODE_CONF) $(GPG_AGENT)
server: apt_packages fish rust

$(BREW):
	@echo Installing Homebrew
	@bash -c "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

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
	@echo /usr/local/bin/fish | sudo tee -a /etc/shells
	@chsh -s $(shell which fish)
	@fish -c fisher

.PHONY: homebrew_packages
homebrew_packages: $(BREW_BUNDLE)
	brew bundle

.PHONY: apt_repositories
apt_repositories:
	sudo apt-add-repository -y ppa:fish-shell/release-3
	sudo apt-get update

.PHONY: apt_packages
apt_packages: apt_repositories
	sudo apt install -y fish neovim curl git git-extras wget tmux python3 docker.io mosh rbenv build-essential universal-ctags

.PHONY: rust
rust:
	@curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

$(GPG_AGENT):
	echo "pinentry-program /usr/local/bin/pinentry-mac" >> $(GPG_AGENT)
