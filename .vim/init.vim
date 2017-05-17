set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" syntax linter
Plugin 'scrooloose/syntastic'
" Better filetree
Plugin 'scrooloose/nerdtree'
" fuzzy search
Plugin 'kien/ctrlp.vim'
" coffee support
Plugin 'kchmck/vim-coffee-script'
" Go development plugin for Vim
Plugin 'fatih/vim-go'
" EditorConfig plugin for Vim http://editorconfig.org
Plugin 'editorconfig/editorconfig-vim'
" VIM airline
Plugin 'bling/vim-airline'
" A better JSON for Vim
Plugin 'elzr/vim-json'
" Make Vim play nicely with iTerm 2 and tmux.
Plugin 'sjl/vitality.vim'
" A Vim plugin which shows a git diff in the gutter
Plugin 'airblade/vim-gitgutter'
" A colorful, dark color scheme for Vim
Plugin 'nanotech/jellybeans.vim'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/freaz/.vim/ownplugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Appearance
language en_US.UTF-8
color jellybeans
syntax on
set showmode
set hidden " Handle multiple buffers better
set number " Show line numbers
set cursorline
set title
set mouse=a
set shortmess=Ia

" Keybindings
set backspace=indent,eol,start

" Formatting
set tabstop=4 " Use 4 spaces to a tab
set shiftwidth=4 " As above
set expandtab " Expand tabs into spaces

" Completion
set complete=.,w,b,u,t,i
set completeopt=menu
set wildmenu " Better completion in the CLI
set wildmode=longest:full,full " Completion settings

" Search
set hlsearch " Highlight all search matches
set incsearch " Highlight matches as you type
set ignorecase
set smartcase " Be case-sensitive if expression contains a capital letter

" Airline config
set laststatus=2

" Backup
set nobackup
set nowritebackup
set directory=$HOME/.vim/tmp//,. " Keep swap files in one place

"Copy copy register to OS X general pasteboard
function! PBCopy()
  call system("pbcopy", getreg(""))
endfunction

" Paste from OS X general pasteboard to copy register
function! PBPaste()
  call setreg("", system("pbpaste"))
endfunction

" By the power of https://github.com/sjl/vitality.vim, copies and pastes
" " to the OS X pasteboard when switching between vim and other windows
" " (even in tmux)
autocmd FocusLost * :call PBCopy()
autocmd FocusGained * :call PBPaste()

" Key mapping
map <C-o> :NERDTreeToggle<CR>

