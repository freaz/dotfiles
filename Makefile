BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle
NVM=~/.nvm/nvm.sh
ZSH_ANTIGEN=~/.zsh/antigen
SUBLIME_OSX=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
SUBLIME_DEBIAN=~/.config/sublime-text-3/Packages/User
VSCODE_SETTINGS_OSX=~/Library/Application\ Support/Code/User
VSCODE_SETTINGS_DEBIAN=~/.config/Code/User/settings.json
TMUX=~/.tmux
TMUX_TPM=~/.tmux/plugins/tpm

all: $(ZSH_ANTIGEN) $(NVM)
osx: homebrew-packages all $(VSCODE_SETTINGS_OSX) $(SUBLIME_OSX)
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

$(SUBLIME_OSX):
	ln -s ~/.sublime_config $(SUBLIME_OSX)

$(SUBLIME_DEBIAN):
	ln -s ~/.sublime_config $(SUBLIME_DEBIAN)

vscode-extensions:
	@sh -c "~/.vscode/sync-extensions.sh"

$(VSCODE_SETTINGS_OSX):
	mkdir -p ${VSCODE_SETTINGS_OSX}
	ln -s ~/.vscode/keybindingsMac.json ${VSCODE_SETTINGS_OSX}/keybindings.json
	ln -s ~/.vscode/settings.json ${VSCODE_SETTINGS_OSX}/settings.json
	ln -s ~/.vscode/snippets ${VSCODE_SETTINGS_OSX}/snippets

$(ZSH_ANTIGEN):
	@git clone https://github.com/zsh-users/antigen.git $(ZSH_ANTIGEN)

$(TMUX_TPM):
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

$(TMUX): $(TMUX_TPM)
	@echo Preparing TMUX

homebrew-packages: $(BREW_BUNDLE)
	brew bundle

debian-packages:
	sudo apt install curl zsh vim git git-extras wget rbenv tmux python3 docker.io

