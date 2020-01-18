BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle
NVM=~/.nvm/nvm.sh
ZSH_ANTIGEN=~/.zsh/antigen
SUBLIME_MACOS=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
SUBLIME_DEBIAN=~/.config/sublime-text-3/Packages/User
VSCODE_SETTINGS_MACOS=~/Library/Application\ Support/Code/User
VSCODE_SETTINGS_DEBIAN=~/.config/Code/User/settings.json
TMUX=~/.tmux
TMUX_TPM=~/.tmux/plugins/tpm

all: $(ZSH_ANTIGEN) $(NVM) fish
macos: homebrew-packages all $(VSCODE_SETTINGS_MACOS) $(SUBLIME_MACOS)
debian: debian-packages all $(SUBLIME_DEBIAN)

.PHONY: homebrew-packages debian-packages vscode-extensions all

$(BREW):
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

$(NVM):
	@echo Installing NVM
	@sh -c "`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh`"

$(SUBLIME_MACOS):
	ln -s ~/.sublime_config $(SUBLIME_MACOS)

$(SUBLIME_DEBIAN):
	ln -s ~/.sublime_config $(SUBLIME_DEBIAN)

vscode-extensions:
	@sh -c "~/.vscode/sync-extensions.sh"

$(VSCODE_SETTINGS_MACOS):
	mkdir -p ${VSCODE_SETTINGS_MACOS}
	ln -s ~/.vscode/keybindingsMac.json ${VSCODE_SETTINGS_MACOS}/keybindings.json
	ln -s ~/.vscode/settings.json ${VSCODE_SETTINGS_MACOS}/settings.json
	ln -s ~/.vscode/snippets ${VSCODE_SETTINGS_MACOS}/snippets

$(ZSH_ANTIGEN):
	@git clone https://github.com/zsh-users/antigen.git $(ZSH_ANTIGEN)

$(TMUX_TPM):
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

$(TMUX): $(TMUX_TPM)
	@echo Preparing TMUX

fish:
	@chsh -s $(shell which fish)
	@fish -c fisher

homebrew-packages: $(BREW_BUNDLE)
	brew bundle

debian-packages:
	sudo apt install curl zsh vim git git-extras wget rbenv tmux python3 docker.io mosh

