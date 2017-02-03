BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle
NVM=~/.nvm/nvm.sh
VUNDLE=~/.vim/bundle/Vundle.vim
OH_MY_ZSH=~/.oh-my-zsh
ZSH_SYNTAX_HIGHLIGHTING=~/.oh-my-zsh-custom/plugins/zsh-syntax-highlighting
SUBMLIME_OSX=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

all: $(OH_MY_ZSH) $(ZSH_SYNTAX_HIGHLIGHTING) $(NVM) $(VUNDLE)
osx: homebrew-packages all $(SUBMLIME_OSX)

.PHONY: homebrew-packages all

$(BREW):
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

$(NVM): 
	@echo Installing NVM
	@sh -c "`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh`"

$(VUNDLE):
	@echo Cloning Vundle.vim
	@git clone https://github.com/VundleVim/Vundle.vim.git $(VUNDLE)

$(SUBMLIME_OSX):
	ln -s ~/.sublime_config $(SUBMLIME_OSX)

$(ZSH_SYNTAX_HIGHLIGHTING): $(OH_MY_ZSH)
	@echo Cloning ZSH Syntax Highlighting
	@git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(ZSH_SYNTAX_HIGHLIGHTING)

$(OH_MY_ZSH): $(BREW_BUNDLE)
	@echo Installing oh-my-zsh
	@sh -c "`curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh`"

homebrew-packages: $(BREW_BUNDLE)
	brew bundle
