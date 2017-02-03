BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle

osx: homebrew-packages oh-my-zsh all

$(BREW):
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

.PHONY: homebrew-packages
homebrew-packages: $(BREW_BUNDLE)
	brew bundle