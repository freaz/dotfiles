set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')


" Vim settings and behaviour
Plug 'sjl/vitality.vim'
Plug 'tpope/vim-sensible'

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" syntax linter
Plug 'scrooloose/syntastic'
" Better filetree
Plug 'scrooloose/nerdtree'
" fuzzy search
Plug 'kien/ctrlp.vim'
" EditorConfig plugin for Vim http://editorconfig.org
Plug 'editorconfig/editorconfig-vim'
" A better JSON for Vim
Plug 'elzr/vim-json'
" A Vim plugin which shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'
" Drakula colorscheme
Plug 'dracula/vim'
" Emmet
Plug 'mattn/emmet-vim'
" Gists support
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" Languages
Plug 'kylef/apiblueprint.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ekalinin/dockerfile.vim'

call plug#end()

" Appearance
language en_US.UTF-8
let g:dracula_colorterm=0
colorscheme dracula
syntax on

set termguicolors
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
set tabstop=2 " Use 4 spaces to a tab
set shiftwidth=2 " As above
set expandtab " Expand tabs into spaces

" Completion
set complete=.,w,b,u,t,i
set completeopt=menu
set wildmenu " Better completion in the CLI
set wildmode=longest:full,full " Completion settings

" Editing
set showmatch
set matchtime=3

" Search
set hlsearch " Highlight all search matches
set incsearch " Highlight matches as you type
set ignorecase
set smartcase " Be case-sensitive if expression contains a capital letter

" Backup
set nobackup
set nowritebackup
set directory=$HOME/.vim/tmp//,. " Keep swap files in one place

" 
"set t_RV=

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
map <C-o> :NERDTreeFocus<CR>

" Working with tabs
nnoremap <C-l> :tabn<cr>
nnoremap <C-h> :tabp<cr>
nnoremap <C-c> :tabnew<cr>

