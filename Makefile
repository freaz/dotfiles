BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle
NVM=~/.nvm/nvm.sh

all: oh-my-zsh $(NVM)
osx: homebrew-packages all

$(BREW):
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

$(NVM): 
	@sh -c "`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh`"

.PHONY: oh-my-zsh-repo
oh-my-zsh-repo: $(BREW_BUNDLE)
	@echo Installing oh-my-zsh
  @sh -c "`curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh`"

.PHONY: oh-my-zsh-plugins
oh-my-zsh-plugins: oh-my-zsh-repo
	@echo Cloning ZSH Syntax Highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

.PHONY: oh-my-zsh
oh-my-zsh: oh-my-zsh-repo oh-my-zsh-plugins

.PHONY: homebrew-packages
homebrew-packages: $(BREW_BUNDLE)
	brew bundle